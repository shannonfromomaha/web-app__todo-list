# This controller is for all the CRUD operations related to a User.
MyApp.get "/user/new" do
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

#DB.define_table("users")
#DB.define_column("users", "name", "string")
#DB.define_column("users", "email", "string")
#DB.define_column("users", "password", "string")
