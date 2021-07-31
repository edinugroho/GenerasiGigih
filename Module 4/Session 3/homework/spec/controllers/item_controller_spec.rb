require_relative '../../controllers/item_controller.rb'

describe ItemController do
    describe '#view' do
        it 'should render item view' do
            items = Item.all
            render = ERB.new(File.read("./views/index.erb")).result(binding)
            expected_render = ItemController.index
            expect(render).to eq(expected_render)
        end

        it 'should render create view' do
            categories = Category.all
            render = ERB.new(File.read("./views/create_item.erb")).result(binding)
            expected_render = ItemController.create
            expect(render).to eq(expected_render)
        end
    end
    
end