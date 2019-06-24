class AddStatusToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :status, :string
  end
end
