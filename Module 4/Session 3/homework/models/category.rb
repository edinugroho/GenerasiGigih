require_relative '../db/db_connector.rb'

class Category
    attr_accessor :id, :name, :items

    def initialize(params)
        @id = params['id']
        @name = params['name']
        @items = params['items']
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
        true
    end

    def self.parse(params)
        if params.nil?
            nil
        end
    end

    def valid?
        return false if @name.empty?
        true
    end
end