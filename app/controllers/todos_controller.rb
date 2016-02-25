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

MyApp.get "/todos/new" do
  @items = Todo.where("user_id" => @currentuser.id)
  erb :"/todos/new"
end

MyApp.post "todos/newitem" do
  t = Todo.new
  t.title = params[:title]
  t.description = params[:description]
  t.completed = false
  t.user_id = params[:user_id]
  t.save
  redirect "/todos/new"
end

MyApp.post "/updatelist" do
  array = params[:items]
  Todo.update(array)
  redirect "/todos/new"  
end

MyApp.get "/todos/delete" do
  @items = Todo.where("user_id" => @currentuser.id)
  erb :"/todos/delete"
end

MyApp.post "/deleteitems" do
  array = params[:items]
  Todo.delete(array)
  redirect "/todos/new"
end



#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")