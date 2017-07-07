class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id
      t.integer :reader_id

      t.timestamps
    end
    add_index :chats, :sender_id
    add_index :chats, :reader_id
    add_index :chats, [:sender_id, :reader_id], unique: true

  end
end
