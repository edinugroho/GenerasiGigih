require_relative '../db/db_connector.rb'
require_relative '../models/item.rb'

class Category
    attr_accessor :id, :name

    def initialize(params)
        @id = params['id']
        @name = params['name']
        @items = []
    end

    def self.all
        client = create_db_client
        datas = client.query("select * from categories");
        parse(datas)
    end

    def save
        return false unless valid?

        client = create_db_client
        client.query("insert into categories (name) values ('#{name}')")
    end

    def delete
        client = create_db_client
        client.query("delete from categories where id = '#{id}'")
        client.query("delete from item_categories where category_id = '#{id}'")
    end

    def items
        client = create_db_client
        datas = client.query("
            select items.id, items.name, items.price from items 
            join item_categories
            on item_categories.item_id = items.id
            join categories
            on item_categories.category_id = categories.id 
            where item_categories.category_id = '#{id}'"
        )
        Item.parse(datas)
    end

    def update(params)
        client = create_db_client
        client.query("update categories set name = '#{params['name']}' where id = #{id}")
    end

    def self.find(id)
        client = create_db_client
        datas = client.query("select * from categories where id = '#{id}'")
        parse(datas)
    end 

    def self.parse(params)
        datas = Array.new
        params.each do |data|
            category = Category.new(data)
            datas.push(category)
        end
        datas
    end

    def valid?
        return false if name.empty? || name.nil?
        true
    end
end