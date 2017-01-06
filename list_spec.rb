require "rspec/given"
require "rspec"

require_relative "list"
require_relative "task"

describe List do
  let(:title) { "To Do" }
  let(:task1)  { Task.new("description 1") }
  let(:task2) { Task.new("description 2") }
  let(:list) { List.new(title, [task1, task2]) }

  describe "#initialize" do

    it "has a list that expects a task" do	
      expect(list)
    end

    it "requires two arguments" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  describe "#add_task" do
   
     it "adds a task into the tasks" do
       list.add_task(Task.new("test test"))   	
       expect(list.tasks.size).to eql(3)
     end
  end

  describe "#complete_task" do
    
    it "will complete a task" do
      list.complete_task(0)
      expect(list.tasks[0].complete?).to be(true)
    end
   
    it "will only complete a task with a valid index" do
      expect(list.complete_task(4)).to be(false)
    end

  end

  describe "#delete_task" do

  	it "will delete a task" do
  	  list.delete_task(0)
      expect(list.tasks.size).to eql(1)
  	end

  	it "will only delete with a valid index" do
  	  list.delete_task(4)
      expect(list.delete_task(4)).to be(false)
    end

  end

  describe "completed_tasks" do
  
    it "will list all completed tasks" do
      list.complete_task(0)
      expect(list.completed_tasks.size).to eql(1)
    end

  end

  describe "incomplete_tasks" do
  
    it "will list all incomplete tasks" do
      list.complete_task(0)
      expect(list.incomplete_tasks.size).to eql(1)
    end

  end

end