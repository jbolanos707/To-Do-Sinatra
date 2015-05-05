require("spec_helper")

describe(List) do
  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#description") do
    it("tells you its name") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      expect(list.description()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:description => "Epicodus stuff", :id => nil})
      list2 = List.new({:description => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe("#tasks") do
    it("starts off with an empty array of tasks") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.tasks()).to(eq([]))
    end
  end

  describe("#add_task") do
    it("lets you save tasks to the task list") do
      list = List.new({:description => "Epicodus stuff", :id => nil})
      list.save()
      task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2015-05-01'})
      list.add_task(task)
      expect(list.tasks()).to(eq([task]))
    end
  end
end
