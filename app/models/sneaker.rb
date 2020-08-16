class Sneaker < ActiveRecord::Base 
    belongs_to :user
end

# When an object belongs to another object, it ALWAYS has the foreign key 