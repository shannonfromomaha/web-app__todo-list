# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/" do 
  erb :"/todos/welcome"
end

MyApp.get "/todos/new" do
  @currentuser = User.find_by_id(session["user_id"]) 
  if @currentuser != nil
    @items = Todo.where("user_id" => @currentuser.id)
    erb :"/todos/new"
  else
    erb :"/logins/new"
  end
end

MyApp.post "/newitem" do
  @currentuser = User.find_by_id(session["user_id"])
  if @currentuser != nil
    t = Todo.new
    t.title = params[:title]
    t.description = params[:description]
    t.completed = false
    t.user_id = params[:user_id]
    t.save
    redirect "/todos/new"
  else
    erb :"logins/new"
  end
end

MyApp.post "/updatelist" do
  @currentuser = User.find_by_id(session["user_id"])
  if @currentuser != nil
    array = params[:items]
    Todo.update(array)
    redirect "/todos/new"  
  else
    erb :"/logins/new"
  end
end

MyApp.get "/todos/delete" do
  @currentuser = User.find_by_id(session["user_id"])
  if @currentuser != nil
    @items = Todo.where("user_id" => @currentuser.id)
    erb :"/todos/delete"
  else
    erb :"/logins/new"
  end
end

MyApp.post "/deleteitems" do
  @currentuser = User.find_by_id(session["user_id"])
  if @currentuser != nil
    array = params[:items]
    Todo.delete(array)
    redirect "/todos/new"
  else
    erb :"/logins/new"
  end
end



#DB.define_table("todos")
#DB.define_column("todos", "title", "string")
#DB.define_column("todos", "description", "text")
#DB.define_column("todos", "completed", "boolean")
#DB.define_column("todos", "user_id", "integer")