class Category
    attr_accessor :name, :id

    def initialize(name, id = nil)
        @name = name
        @id = id
    end

    def self.all
        client = create_db_client
        raw_data = client.query("select * from categories")
        categories = Array.new
        
        raw_data.each do |data|
            category = Category.new(data['name'], data['id'])
            categories.push(category)
        end
        categories
    end
end