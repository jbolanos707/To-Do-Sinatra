require('rspec')
require('pg')
require('task')
require('list')
require('pry')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM task *;")
    DB.exec("DELETE FROM lists *;")
  end
end
