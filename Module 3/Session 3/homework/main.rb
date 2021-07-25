require 'sinatra'
require_relative './controllers/item_controller.rb'
require_relative './controllers/category_controller.rb'

get '/' do
    ItemController.index
end

get '/item/create' do
    ItemController.create
end

post '/item/store' do
    ItemController.store(params)
    redirect '/'
end

delete '/item/:id' do
    ItemController.destroy(params['id'])
    redirect '/'
end

get '/item/:id' do
    ItemController.show(params['id'])
end

put '/item/:id' do
    ItemController.update(params)
    redirect '/'
end

get '/item/:id/edit' do
    ItemController.edit(params['id'])
end

# category

get '/category' do
    CategoryController.index
end

get '/category/create' do
    CategoryController.create
end

post '/category/store' do
    CategoryController.store(params)
    redirect '/category'
end

get '/category/:id' do
    CategoryController.show(params['id'])
end

get '/category/:id/edit' do
    CategoryController.edit(params['id'])
end

put '/category/:id' do
    CategoryController.update(params)
    redirect '/category'
end

delete '/category/:id' do
    CategoryController.destroy(params['id'])
    redirect '/category'
end