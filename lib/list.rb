class List
  attr_reader(:description, :id, :tasks)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
    @tasks = []
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      description = list.fetch('description')
      id = list.fetch('id').to_i()
      lists.push(List.new({:description => description, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (description) VALUES ('#{@description}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_list|
    self.description().==(another_list.description()).&((self.id()).==(another_list.id()))
  end

  define_method(:add_task) do |task|
    @tasks.push(task)
  end
end
