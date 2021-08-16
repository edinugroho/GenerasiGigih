class Item
    attr_accessor :name, :price, :id, :category

    def initialize(name, price, id = nil , category = nil)
        @name = name
        @price = price
        @id = id
        @category = category
        @client = create_db_client 
    end

    def self.all
        raw_data = @client.query("select * from items")
        
        items = Array.new
        raw_data.each do |item|
            temp_item = Item.new(item['name'], item['price'], item['id'])
            items.push(temp_item)
        end
        items
    end

    def self.get_items_cheaper_than(price)
        cheap_items = @client.query("select * from items where price < #{price}")
    end
    

    def self.create(item)
        @client.query("insert into items (name, price) values ('#{item.name}', '#{item.price}')")
    end

    
    def self.delete(id)
        @client.query("delete from items where id = '#{id}'")
    end

    def self.update(id, item)
        @client.query("update items set name = '#{item.name}', price = '#{item.price}' WHERE id = #{item.id};")
        add_item_to_category(item.id, item.category)
    end

    def self.detail(id)
        raw_data = @client.query("
            select items.id, items.name, items.price, categories.name as category_name, categories.id as category_id from items
            left join item_categories
            on item_categories.item_id = items.id
            left join categories
            on item_categories.category_id = categories.id
            where items.id = #{id}   
        ")
        parse_item(raw_data)
    end

    def add_item_to_category(item_id, category_id)
        check = @client.query("select * from item_categories where item_id = '#{item_id}' and category_id = '#{category_id}'")
        if check.count == 0
            client.query("insert into item_categories (item_id, category_id) values ('#{item_id}', '#{category_id}')")
        end
    end

    def self.item_with_categories
        raw_data = @client.query("
            select items.id, items.name, categories.name as category_name, categories.id as category_id from items
            left join item_categories
            on item_categories.item_id = items.id
            left join categories
            on item_categories.category_id = categories.id
        ")
        parse_item(raw_data)
    end

    def parse_item(params)
        items = Array.new   
        params.each do |data|
            category = Category.new(data['category_name'], data['category_id'])
            item = Item.new(data['name'], data['price'], data['id'], category)
            items.push(item)
        end
        items
    end
end