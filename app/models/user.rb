class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :friend
  has_many :friendships
  has_many :participated_friends, through: :friendships, source: :friend

#   def is_friend?(friend)
#     participated_friends.include?(friend)
#   end
#
#   def join!(friend)
#     participated_friends << friend
#   end
#
#   def quit!(friend)
#     participated_friends.delete(friend)
#   end
end
