require_relative '../db/db_connector.rb'
require_relative '../models/item_categories.rb'
require_relative '../models/category.rb'

class Item
    attr_accessor :id, :name, :price, :categories

    def initialize(params)
        @id = params['id']
        @name = params['name']
        @price = params['price']
        @categories = params['categories']
    end

    def self.all
        client = create_db_client
        datas = client.query("select * from items");
        parse(datas)
    end

    def save
        return false unless valid?

        client = create_db_client
        client.query("insert into items (name,price) values ('#{name}','#{price}')")
        item_id = client.query("select * from items where id = (select last_insert_id())").each[0]["id"]
        @categories.each do |category|
            item_category = ItemCategories.new({
                'item_id' => item_id,
                'category_id' => category
            })
            item_category.save
        end
    end

    def update(params)
        client = create_db_client
        client.query("update items set name = '#{params['name']}' ,price = '#{params['price']}' where id = #{id}")
        if params['categories'] != nil
            params['categories'].each do |category|
                item_category = ItemCategories.new({
                    'item_id' => id,
                    'category_id' => category
                })
                item_category.save
            end
        else
            categories.each do |category|
                ItemCategories.remove_categories(id, category.id)
            end
        end
    end

    def categories
        client = create_db_client
        datas = client.query("
            select categories.id, categories.name from items 
            join item_categories
            on item_categories.item_id = items.id
            join categories
            on item_categories.category_id = categories.id 
            where item_categories.item_id = '#{id}'"
        )
        Category.parse(datas)
    end

    def delete
        client = create_db_client
        client.query("delete from items where id = '#{id}'")
    end

    def self.find(id)
        client = create_db_client
        datas = client.query("select * from items where id = '#{id}'");
        parse(datas)
    end
    

    def self.parse(params)
        datas = Array.new
        params.each do |data|
            item = Item.new(data)
            datas.push(item)
        end
        datas
    end

    def valid?
        return false if @name.empty?
        return false if @price.empty?
        true
    end
end