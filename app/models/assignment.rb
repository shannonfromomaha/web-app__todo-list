class Assignment < ActiveRecord::Base
  def self.delete_assignments(array)
    array.each do |item|
      a = Assignment.where("todo_id" => item)
      a.each do |a|
        a.delete
      end
    end
  end


end

#DB.define_table("assignments")
#DB.define_column("assignments","todo_id","integer")
#DB.define_column("assignments","user_id","integer")