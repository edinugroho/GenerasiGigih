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

    def self.find(id)
        client = create_db_client
        datas = client.query("select * from categories where id = '#{id}'");
        if datas == nil
            nil
        else
            parse(datas)
        end
    end

    def update(params)
        client = create_db_client
        client.query("update categories set name = '#{params['name']}' where id = #{id}")
    end

    def delete
        client = create_db_client
        client.query("delete from categories where id = '#{id}'")
    end

    def self.parse(params)
        if params.nil?
            nil
        else
            datas = Array.new
            params.each do |data|
                item = Category.new(data)
                datas.push(item)
            end
            datas
        end
    end

    def valid?
        return false if @name.empty?
        true
    end
end