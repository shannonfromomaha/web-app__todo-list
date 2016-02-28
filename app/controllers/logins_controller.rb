
MyApp.get "/" do 
  erb :"/logins/new"
end

MyApp.get "/logins/new" do 
  erb :"/logins/new"
end

MyApp.post "/logins/delete" do
  session["user_id"] = nil
  redirect "/logins/new"
end

MyApp.post "/newlogin" do
  @currentuser = User.find_by_email(params[:email])
  if @currentuser == nil
    erb :"/logins/fail"
  elsif @currentuser.password == params[:password]
    session["user_id"] = @currentuser.id
    redirect "/todos/welcome"
  else
    erb :"/logins/fail"
  end
end
  

# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.