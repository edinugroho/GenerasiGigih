require 'sinatra'
require './db_connector.rb'
require './item.rb'
require './category.rb'

get '/' do
    items = get_all_items
    erb :index, locals: {
        items: items
    }
end

get '/items/new' do
    erb :create
end

post '/items/create' do
    name = params['name']
    price = params['price']
    item = Item.new(name,price)
    create_new_item(item)
    redirect '/'
end

get '/items/:id' do
    id = params['id']
    items = get_item_details(id)
    erb :detail, locals: {
        items: items
    }
end

get '/items/:id/edit' do
    id = params['id']
    categories = get_all_categories
    items = get_item_details(id)
    erb :edit, locals: {
        id: id,
        items: items,
        categories: categories
    }
end

put '/items/:id' do
    id = params['id']
    name = params['name']
    price = params['price']
    category = params['category']
    item = Item.new(name,price,id,category)
    update_item(id, item)
    redirect '/' 
end

get '/items/:id/delete' do
    id = params['id']
    delete_item(id)
    redirect '/'
end