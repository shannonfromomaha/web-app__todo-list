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
    x = self.user_id
    return user = User.find_by_id(x)
  end

  def find_assigned
    x = self.assigned_id
    return user = User.find_by_id(x)
  end

  def find_category
    x = self.category_id
    return cat =Category.find_by_id(x)
  end

end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")
#DB.define_column("todos", "assigned_id", "integer")
#DB.define_column("todos", "category_id", "integer")