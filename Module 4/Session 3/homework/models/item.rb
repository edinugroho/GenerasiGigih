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

    def valid?
        return false if @name.empty?
        return false if @price.empty?
        true
    end
end