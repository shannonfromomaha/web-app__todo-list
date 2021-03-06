class Todo < ActiveRecord::Base
  #write a tessssst for thiiiiiiiiis
  def self.update(array)
    array.each do |item|
      c = Todo.find_by_id(item)
      c.completed = true
      c.save
      #something like (array of completed to do)
      #if it's on that list and not this list
      #say it's uncompleted
      #or just make a different list(then go back to toggles)
    end
  end

  def find_creator
    x = User.find_by_id(self.user_id)
    if x == [] || x == nil
      return "N/A"
    else 
      return x.name
    end
  end

  def find_assigned
    x = Assignment.where("todo_id" => self.id)
    usernames = []
    x.each do |assignment|
      usernames << User.find_by_id(assignment.user_id).name
    end
    return usernames
  end

  def find_category
    x = self.category_id
    return cat =Category.find_by_id(x)
  end

  def assign(userarray)
    x = self.id
    userarray.each do |assign|
      a = Assignment.new
      a.todo_id = x
      a.user_id = assign
      a.save
    end
  end

end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")
#DB.define_column("todos", "assigned_id", "integer")
#DB.define_column("todos", "category_id", "integer")