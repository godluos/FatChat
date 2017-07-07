class Chat < ApplicationRecord
  validates :sender, uniqueness: {scope: :reader}
  belongs_to :sender, class_name: 'User'
  belonds_to :receiver, class_name: 'User'
  has_many :messages, ->{order(created_at: :asc)}, dependent: :destroy

  scope :participating, -> (user) do
    where("(chats.sender_id = ? OR chats.reader_id = ?)", user.id, user.id)
  end

  def with(current_user)
    sender == current_user ? receiver : sender
  end

  def participates?(user)
  sender == user || reader == user
end
end
