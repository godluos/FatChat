class Friend < ApplicationRecord
  belongs_to :user
  has_many :friendships
  has_many :members, through: :friendships, source: :user

  def is_friend?(user)
    members.include?(user)
  end

  def join!(user)
    members << user
  end

  def quit!(user)
    members.delete(user)
  end
end
