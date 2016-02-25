# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/" do 
  erb :"/todos/welcome"
end

MyApp.before "/todos*" do
  @currentuser = User.find_by_id(session["user_id"]) 
  if @currentuser != nil
    redirect "/logins/new"
  end
end

MyApp.get "/todos/welcome" do
  @items = Todo.all

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
  redirect "/todos/new"
end

MyApp.post "/todos/update" do
  #this marks a thing as done or not done
  array = params[:items]
  Todo.update(array)
  redirect "/todos/new"  
end

#these two are messy now bc you might not want to delete--
#just reassign or rename a task
MyApp.get "/todos/edit" do
  @items = Todo.where("user_id" => @currentuser.id)
  erb :"/todos/delete"
end
#so post todos/delete should actually be ON edit page
MyApp.post "/todos/delete" do
  array = params[:items]
  Todo.delete(array)
  redirect "/todos/new"
end

#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")