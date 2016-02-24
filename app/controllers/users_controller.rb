# This controller is for all the CRUD operations related to a User.
MyApp.get "/users/new" do
  erb :"/users/new"
end

MyApp.post "/newuser" do
  u = User.new
  u.name = params[:name]
  u.email = params[:email]
  u.password = params[:password]
  u.save
  @user = u
  erb :"/users/success"  
end

MyApp.get "/users/update/:id" do
  @currentuser = User.find_by_id(session["user_id"])
  if @currentuser != nil
    erb :"/users/update"
  else
    erb :"/logins/new"
  end
end

MyApp.post "/updateuser/:id" do
  @currentuser = User.find_by_id(session["user_id"])
  if @currentuser != nil
    u = User.find_by_id(params[:id])
    u.name = params[:name]
    u.email = params[:email]
    u.password = params[:password]
    u.save
    erb :"/users/success"  
  else
    erb :"/logins/new"
  end
end 

MyApp.post "/deleteuser/:id" do
  u = User.find_by_id(params[:id])
  #something that deletes their to-do lists
  u.delete
  erb :"/users/deletesuccess"
end

#DB.define_table("users")
#DB.define_column("users", "name", "string")
#DB.define_column("users", "email", "string")
#DB.define_column("users", "password", "string")
