require 'mysql2'
require './category.rb'
require './item.rb'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "edi",
        :database => "food_oms_db"
    )
    client
end

def get_all_items
    client = create_db_client
    rawData = client.query("select * from items")
    items = Array.new
    
    rawData.each do |data|
        item = Item.new(data['name'], data['price'], data['id'])
        items.push(item)
    end
    items
end

def get_all_categories
    client = create_db_client
    rawData = client.query("select * from categories")
    categories = Array.new
    
    rawData.each do |data|
        category = Category.new(data['name'], data['id'])
        categories.push(category)
    end
    categories
end

def get_all_item_with_categories
    client = create_db_client
    rawData = client.query("
        select items.id, items.name, categories.name as category_name, categories.id as category_id from items
        left join item_categories
        on item_categories.item_id = items.id
        left join categories
        on item_categories.category_id = categories.id
    ")
    items = Array.new
    
    rawData.each do |data|
        category = Category.new(data['category_name'], data['category_id'])
        item = Item.new(data['name'], data['price'], data['id'], category)
        items.push(item)
    end
    items
end

def get_items_cheaper_than(price)
    client = create_db_client
    cheap_items = client.query("select * from items where price < #{price}")
end

def create_new_item(item)
    client = create_db_client
    client.query("insert into items (name, price) values ('#{item.name}', '#{item.price}')")
end

def add_item_to_category(item_id, category_id)
    client = create_db_client
    check = client.query("select * from item_categories where item_id = '#{item_id}' and category_id = '#{category_id}'")
    if check.count == 0
        client.query("insert into item_categories (item_id, category_id) values ('#{item_id}', '#{category_id}')")
    end
end

def delete_item(id)
    client = create_db_client
    client.query("delete from items where id = '#{id}'")
end

def get_item_details(id)
    client = create_db_client
    rawData = client.query("
        select items.id, items.name, items.price, categories.name as category_name, categories.id as category_id from items
        left join item_categories
        on item_categories.item_id = items.id
        left join categories
        on item_categories.category_id = categories.id
        where items.id = #{id}   
    ")
    items = Array.new

    rawData.each do |data|
        category = Category.new(data['category_name'], data['category_id'])
        item = Item.new(data['name'], data['price'], data['id'], category)
        items.push(item)
    end
    items
end

def update_item(id, item)
    client = create_db_client
    client.query("update items set name = '#{item.name}', price = '#{item.price}' WHERE id = #{item.id};")
    add_item_to_category(item.id, item.category)
end