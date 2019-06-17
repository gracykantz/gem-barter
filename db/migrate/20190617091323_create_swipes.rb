class CreateSwipes < ActiveRecord::Migration[5.2]
  def change
    create_table :swipes do |t|
      t.boolean :liked
      t.references :furniture_item, foreign_key: true

      t.timestamps
    end
  end
end
