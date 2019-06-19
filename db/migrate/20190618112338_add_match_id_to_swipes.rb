class AddMatchIdToSwipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :swipes, :match, foreign_key: true
  end
end
