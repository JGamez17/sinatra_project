class User < ActiveRecord::Base 
    has_many :sneakers
    validates :username, presence: :true, uniqueness: :true
    has_secure_password #this is a MACRO, provides methods and validations
end