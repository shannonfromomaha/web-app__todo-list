class User < ActiveRecord::Base

  def find_assignment(item)
    x = Assignment.where("user_id" => self.id, "todo_id" => item.id)
    if x == []
      return false
    else
      return true
    end
  end

end

#DB.define_table("users")
#DB.define_column("users", "name", "string")
#DB.define_column("users", "email", "string")
#DB.define_column("users", "password", "string")
