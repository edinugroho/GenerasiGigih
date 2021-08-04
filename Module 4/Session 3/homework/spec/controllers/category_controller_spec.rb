require_relative '../../controllers/category_controller.rb'

describe CategoryController do
    describe '#view' do
        it 'should render item view' do
            categories = Category.all
            render = ERB.new(File.read("./views/category.erb")).result(binding)
            expected_render = CategoryController.index
            expect(render).to eq(expected_render)
        end

        it 'should render create view' do
            categories = Category.all
            render = ERB.new(File.read("./views/create_category.erb")).result(binding)
            expected_render = CategoryController.create
            expect(render).to eq(expected_render)
        end
    end
    
end