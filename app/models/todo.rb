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
end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")