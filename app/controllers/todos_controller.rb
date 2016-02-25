# This controller is for all the CRUD operations related to a Todo.
MyApp.before "/todos*" do
  @currentuser = User.find_by_id(session["user_id"]) 
  if @currentuser == nil
    redirect "/logins/new"
  end
end

MyApp.get "/todos/welcome" do
  @items = Todo.all
  erb :"/todos/welcome"
end

MyApp.get "/todos/new" do
  #as it stands, 
  #this would be more of a "personal profile" page
  @items = Todo.where("user_id" => @currentuser.id)
  erb :"/todos/new"
end

MyApp.post "/todos/newitem" do
  t = Todo.new
  t.title = params[:title]
  t.description = params[:description]
  t.completed = false
  t.user_id = params[:user_id]
  #needs assignment id today
  #needs a category id today
  t.save
  redirect "/todos/welcome"
end

MyApp.post "/todos/toggle" do
  #this marks a thing as done or not done
  array = params[:items]
  Todo.update(array)
  redirect "/todos/welcome"  
end

#these two are messy now bc you might not want to delete--
#just reassign or rename a task
MyApp.get "/todos/edit" do
  @items = Todo.all
  erb :"/todos/edit"
end
#so post todos/delete should actually be ON edit page
MyApp.post "/todos/delete" do
  array = params[:items]
  Todo.delete(array)
  redirect "/todos/edit"
end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")