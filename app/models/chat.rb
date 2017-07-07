class Chat < ApplicationRecord

  belongs_to :sender, class_name: 'User'
  belongs_to :reader, class_name: 'User'
  has_many :messages, -> {order(created_at: :asc)}, dependent: :destroy
  validates :sender, uniqueness: {scope: :reader}
  scope :participating, -> (user) do
    where("(chats.sender_id = ? OR chats.reader_id = ?)", user.id, user.id)
  end

  scope :between, -> (sender_id, reader_id) do
    where(sender_id: sender_id, reader_id: reader_id).
    or(where(sender_id: reader_id, reader_id: sender_id)).limit(1)
  end

  def with(current_user)
    sender == current_user ? reader : sender
  end

  def participates?(user)
    sender == user || reader == user
  end
end
