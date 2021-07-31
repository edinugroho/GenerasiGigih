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

    describe "#show" do
        context "with no result" do
            it 'should return nil' do
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from items")
                Item.all
            end

            it 'should return nil if id not found' do
                id = 1
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from items where id = '#{id}'").and_return(nil)
                item = Item.find(id)

                expect(nil).to eq(item)
            end
        end 

        context "with result" do
            it 'should return all items' do
                mock_items = [
                    {'id' => 1, 'name' => 'Baso', 'price' => 12000, 'categories'=> ''},
                    {'id' => 2, 'name' => 'Mie', 'price' => 10000, 'categories'=> ''}
                ]
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from items").and_return(mock_items)
                items = Item.all

                expected_items = [
                    Item.new(mock_items[0]),
                    Item.new(mock_items[1])
                ]

                items.each_with_index do |variable, index|
                    expect(expected_items[index].id).to eq(items[index].id)              
                    expect(expected_items[index].name).to eq(items[index].name)              
                    expect(expected_items[index].price).to eq(items[index].price)              
                end
            end

            it 'should return one item' do
                id = 1
                mock_item = [
                    {'id' => 1, 'name' => 'Baso', 'price' => 12000, 'categories'=> ''}
                ]
                mock_client = double
                allow(Mysql2::Client).to receive(:new).and_return(mock_client)
                expect(mock_client).to receive(:query).with("select * from items where id = '#{id}'").and_return(mock_item)
                item = Item.find(id).first

                expected_item = Item.new(mock_item.first)
                expect(expected_item.id).to eq(item.id)
                expect(expected_item.name).to eq(item.name)
                expect(expected_item.price).to eq(item.price)
            end
        end  
    end
end