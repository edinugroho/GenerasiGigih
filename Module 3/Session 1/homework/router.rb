require 'sinatra'
require './db_connector.rb'
require './item.rb'
require './category.rb'

get '/' do
    items = Item.all
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
    Item.create(item)
    redirect '/'
end

get '/items/:id' do
    id = params['id']
    items = Item.detail(id)
    erb :detail, locals: {
        items: items
    }
end

get '/items/:id/edit' do
    id = params['id']
    categories = Category.all
    items = Item.detail(id)
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
    Item.update(id, item)
    redirect '/' 
end

get '/items/:id/delete' do
    id = params['id']
    Item.delete(id)
    redirect '/'
end