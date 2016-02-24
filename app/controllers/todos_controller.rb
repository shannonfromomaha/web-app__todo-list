# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/" do 
  erb :"/todos/welcome"
end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")