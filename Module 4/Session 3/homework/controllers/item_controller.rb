require_relative '../models/item.rb'
require_relative '../models/category.rb'

class ItemController
    def self.index
        items = Item.all
        render = ERB.new(File.read("./views/index.erb"))
        render.result(binding)
    end

    def self.create
        categories = Category.all
        render = ERB.new(File.read("./views/create_item.erb"))
        render.result(binding)
    end
end