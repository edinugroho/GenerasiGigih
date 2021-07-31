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
    end
end