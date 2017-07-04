class Friend < ApplicationRecord
  has_many :friendships
  has_many :members, through: :friendships, source: :user
end
