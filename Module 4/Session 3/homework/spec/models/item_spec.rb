require_relative '../../db/db_connector.rb'
require_relative '../../models/item.rb'

describe Item do
    describe "#validation" do
        context "with invalid object" do
            it 'should return false if contain empty params' do
                item = Item.new({
                    'name' => '',
                    'price' => '',
                    'categories' => '',
                })
                result = item.valid?
                expect(result).to eq(false)
            end
        end
    end
end