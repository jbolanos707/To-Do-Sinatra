require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('./lib/list')
require('pg')

DB = PG.connect({:dbname => 'to_do'})

get('/') do
  erb(:index)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get('/tasks/:id') do
  list = List.find(params.fetch('id').to_i())
  @description = list.description
  erb(:tasks)
end

post('/lists') do
  description = params.fetch("list_description")
  list = List.new({:description => description, :id => nil})
  list.save()
  @lists = List.all()
  erb(:lists)
end
