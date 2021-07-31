require_relative '../db/db_connector.rb'

class Category
    attr_accessor :id, :name, :items

    def initialize(params)
        @id = params['id']
        @name = params['name']
        @items = params['items']
    end

    def save
        return false unless valid?
    end

    def valid?
        return false if @name.empty?
        true
    end
end