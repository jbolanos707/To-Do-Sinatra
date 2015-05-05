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
  @list = List.find(params.fetch('id').to_i())
  @description = @list.description
  @tasks = Task.find(@list.id)
  erb(:tasks)
end

post('/lists') do
  description = params.fetch("list_description")
  list = List.new({:description => description, :id => nil})
  list.save()
  @lists = List.all()
  erb(:lists)
end

post('/tasks') do
  description = params.fetch("task_description")
  due_date = params.fetch("due_date")
  list_id = params.fetch("list_id").to_i()
  task = Task.new({:description => description, :due_date => due_date, :list_id => list_id})
  task.save()
  @list = List.find(list_id)
  @description = @list.description
  #@tasks = @list.tasks # <---- list.tasks doesn't contain any tasks! we never put any in there. the tables aren't linked!
  @tasks = Task.find(list_id)
  erb(:tasks)
end
