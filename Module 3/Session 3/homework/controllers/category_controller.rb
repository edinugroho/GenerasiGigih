require_relative '../models/category.rb'

class CategoryController
    def self.index
        categories = Category.all
        render = ERB.new(File.read("./views/category.erb"))
        render.result(binding)
    end

    def self.create
        render = ERB.new(File.read("./views/create_category.erb"))
        render.result(binding)
    end

    def self.destroy(id)
        category = Category.find(id)[0]
        category.delete
    end

    def self.edit(id)
        category = Category.find(id)[0]
        render = ERB.new(File.read("./views/category_update.erb"))
        render.result(binding)
    end

    def self.update(params)
        item = Category.find(params['id'])[0]
        item.update({
            'name' => params['name']
        })
    end

    def self.store(params)
        category = Category.new({
            'name' => params['name']
        })
        category.save
    end

    def self.show(id)
        category = Category.find(id)[0]
        render = ERB.new(File.read("./views/category_details.erb"))
        render.result(binding)
    end
end