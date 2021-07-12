require 'sinatra'

tasks = []

get '/hello' do
    "<h1 style=\"background-color:DodgerBlue\">Hello World!</h1>"
end

get '/hello/:name' do
    name = params['name']
    color = params['color'] ? params['color'] : 'DodgerBlue'
    erb :message, locals: {
        color: color,
        name: name
    }
end

get '/login' do
    erb :login
end

post '/login' do
    if params['username'] == 'admin' and params['password'] == 'admin'
        return 'Loged in'
    else
        redirect 'login'
    end
end

get '/task' do
    erb :task, locals: {
        tasks: tasks
    }
end

post '/task' do
    tasks.append(params['task'])
    redirect 'task'
end

get '/task/clear' do
    tasks = []
    redirect 'task'
end


