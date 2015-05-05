require("spec_helper")

describe(Task) do

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end

    it("returns the tasks in due date order") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      task1.save()
      task2 = Task.new({:description => "study", :list_id => 1, :due_date => '2015-05-03'})
      task2.save()
      task3 = Task.new({:description => "wash the dog", :list_id => 1, :due_date => '2015-05-02'})
      task3.save()
      expect(Task.all()).to(eq([task1, task3, task2]))
    end
  end

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      expect(task1).to(eq(task2))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#list_id') do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#due_date') do
    it("returns a due date") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      expect(test_task.due_date()).to(eq('2015-05-01'))
    end
  end
end
