require_relative '../db/db_connector.rb'
require_relative '../models/item.rb'


class ItemCategories
    def initialize(params)
        @item_id = params['item_id']
        @category_id = params['category_id']
    end

    def self.all
        client = create_db_client
        client.query('select * from item_categories')
    end

    def save
        client = create_db_client
        check = client.query("select * from item_categories where item_id = '#{@item_id}' and category_id = '#{@category_id}'")
        if check.each.any?
            puts "relation is exist"
        else
            client.query("insert into item_categories values ('#{@item_id}', '#{@category_id}')")
        end 
    end

    def self.remove_categories(id, category)
        client = create_db_client
        check = client.query("delete from item_categories where item_id = '#{id}' and category_id = '#{category}'")
    end

    def self.show_items_by_category(category_id)
        client = create_db_client
        raw_data = client.query("select * from item_categories where category_id = '#{category_id}'")
        datas = Array.new
        raw_data.each do |data|
            item_categories = Item.find({
                'id' => data['item_id']
            })
            datas.push(item_categories)
        end
    end

    def self.parse(params)
        datas = Array.new
        params.each do |data|
            item_categories = Item.new(data)
            datas.push(item_categories)
        end
        datas
    end
end