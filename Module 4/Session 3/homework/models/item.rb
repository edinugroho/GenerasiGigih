require_relative '../db/db_connector.rb'

class Item
    attr_accessor :id, :name, :price, :categories

    def initialize(params)
        @id = params['id']
        @name = params['name']
        @price = params['price']
        @categories = params['categories']
    end 

    def save
        if self.valid?
            client = create_db_client
            client.query("insert into items (name,price) values ('#{name}','#{price}')")
            true
        else
            false
        end
    end

    def self.all
        client = create_db_client
        datas = client.query("select * from items")
        parse(datas) 
    end

    def update(params)
        client = create_db_client
        client.query("update items set name = '#{params['name']}' ,price = '#{params['price']}' where id = #{id}")
        params
    end

    def delete
        client = create_db_client
        client.query("delete from items where id = '#{id}'")
    end

    def self.find(id)
        client = create_db_client
        datas = client.query("select * from items where id = '#{id}'");
        if datas == nil
            nil
        else
            parse(datas)
        end
    end

    def self.parse(params)
        if params == nil
            nil
        else
            datas = Array.new
            params.each do |data|
                item = Item.new(data)
                datas.push(item)
            end
            datas
        end
    end

    def valid?
        return false if @name.empty?
        return false if @price.empty?
        true
    end
end