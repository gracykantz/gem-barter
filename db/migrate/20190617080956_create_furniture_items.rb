class CreateFurnitureItems < ActiveRecord::Migration[5.2]
  def change
    create_table :furniture_items do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.integer :matched_to_id

      t.timestamps
    end
  end
end
