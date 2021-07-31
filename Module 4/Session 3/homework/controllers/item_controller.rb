require_relative '../models/item.rb'

class ItemController
    def self.index
        items = Item.all
        render = ERB.new(File.read("./views/index.erb"))
        render.result(binding)
    end
end