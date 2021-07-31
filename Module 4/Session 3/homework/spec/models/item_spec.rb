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

        context "with valid object" do
            it 'should return true if filled name and price' do
                item = Item.new({
                    'name' => 'item name',
                    'price' => '2000',
                    'categories' => '',
                })
                result = item.valid?
                expect(result).to eq(true)
            end
        end
    end

    describe "#insert" do
        context "with invalid input" do
            it 'should return false if contain empty object' do
                item = Item.new({
                    'name' => '',
                    'price' => '',
                    'categories' => '',
                })
                result = item.save
                expect(result).to eq(false)
            end
        end 
        
        context "with valid input" do
            it 'should return true if filled name and price' do
                item = Item.new({
                    'name' => 'new item',
                    'price' => '2000',
                    'categories' => '',
                })

                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("insert into items (name,price) values ('#{item.name}','#{item.price}')")
                item.save
            end
        end 
    end
end