
MyApp.get "/categories" do
  @categories = Category.all
  erb :"/categories/all"
end

MyApp.post "/categories/new" do
  c = Category.new
  c.name = params[:name]
  c.save
  redirect "/categories"
end

MyApp.post "/categories/delete" do
  array = params[:categories]
  Category.delete(array)
  redirect "/categories"
end