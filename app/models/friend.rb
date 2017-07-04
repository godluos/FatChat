class Friend < ApplicationRecord
  belongs_to :user
  has_many :friendships
  has_many :members, through: :friendships, source: :user
end
