class User < ActiveRecord::Base 
    has_many :sneakers
    validates :user, presence: :true, uniqueness: :true
    has_secure_password 
end