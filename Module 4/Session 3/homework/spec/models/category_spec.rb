require_relative '../../db/db_connector.rb'
require_relative '../../models/category.rb'

describe Category do
    describe "#validation" do
        context "with invalid object" do
            it 'should return false if contain empty params' do
                category = Category.new({
                    'name' => ''
                })
                result = category.valid?
                expect(result).to eq(false)
            end
        end

        context "with valid object" do
            it 'should return true if filled name' do
                category = Category.new({
                    'name' => 'category name'
                })
                result = category.valid?
                expect(result).to eq(true)
            end
        end
    end

    describe "#insert" do
        context "with invalid input" do
            it 'should return false if contain empty object' do
                category = Category.new({
                    'name' => ''
                })
                result = category.save
                expect(result).to eq(false)
            end
        end

        context "with valid input" do
            it 'should return true if filled name' do
                category = Category.new({
                    'name' => 'new category'
                })

                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("insert into categories (name) values ('#{category.name}')")
                category.save
            end
        end 
    end

    describe "#show" do
        context "with no result" do
            it 'should return nil' do
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from categories")
                Category.all
            end

            it 'should return nil if id not found' do
                id = 1
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from categories where id = '#{id}'").and_return(nil)
                category = Category.find(id)

                expect(nil).to eq(category)
            end
        end

        context "with result" do
            it 'should return all categories' do
                mock_categories = [
                    {'id' => 1, 'name' => 'Main Dish', 'items'=> ''},
                    {'id' => 2, 'name' => 'Beverage', 'items'=> ''}
                ]
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from categories").and_return(mock_categories)
                categories = Category.all

                expected_categories = [
                    Category.new(mock_categories[0]),
                    Category.new(mock_categories[1])
                ]

                categories.each_with_index do |variable, index|
                    expect(expected_categories[index].id).to eq(categories[index].id)              
                    expect(expected_categories[index].name).to eq(categories[index].name)             
                end
            end

            it 'should return one category' do
                id = 1
                mock_category = [
                    {'id' => 2, 'name' => 'Beverage', 'items'=> ''}
                ]
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from categories where id = '#{id}'").and_return(mock_category)
                category = Category.find(id).first

                expected_category = Category.new(mock_category.first)
                expect(expected_category.id).to eq(category.id)
                expect(expected_category.name).to eq(category.name)
            end
        end
    end
end