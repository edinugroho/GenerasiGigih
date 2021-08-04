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

    def self.show(id)
        item = Item.find(id)[0]
        render = ERB.new(File.read("./views/item_details.erb"))
        render.result(binding)
    end

    def self.edit(id)
        item = Item.find(id)[0]
        categories = Category.all
        render = ERB.new(File.read("./views/item_update.erb"))
        render.result(binding)
    end

    def self.destroy(id)
        item = Item.find(id)[0]
        item.delete
    end

    def self.store(params)
        item = Item.new({
            'name' => params['name'],
            'price' => params['price'],
            'categories' => params['categories']
        })
        item.save
    end
end