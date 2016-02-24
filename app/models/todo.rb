class Todo < ActiveRecord::Base
  #write a tessssst for thiiiiiiiiis
  def self.update(array)
    array.each do |item|
      c = Todo.find_by_id(item)
      c.completed = !c.completed
      c.save
    end
  end
end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")