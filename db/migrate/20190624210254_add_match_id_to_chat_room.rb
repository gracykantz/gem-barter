class AddMatchIdToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :match_id, :integer
  end
end
