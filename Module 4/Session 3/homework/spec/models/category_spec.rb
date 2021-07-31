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
        end
    end
end