class Chat < ApplicationRecord
  validates :sender, uniqueness: {scope: :reader}
  belongs_to :sender, class_name: 'User'
  belonds_to :receiver, class_name: 'User'
  has_many :messages, ->{order(created_at: :asc)}, dependent: :destroy
end
