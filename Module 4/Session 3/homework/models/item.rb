require_relative '../db/db_connector.rb'

class Item
    def initialize(params)
        @id = params['id']
        @name = params['name']
        @price = params['price']
        @categories = params['categories']
    end 
    
    def valid?
        return false if @name.empty?
        return false if @price.empty?
        true
    end
end