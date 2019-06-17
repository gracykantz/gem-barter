class AddForeignKeyFurnitureItemToSwipeForWantedFurnitureId < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :swipes, :furniture_items, column: :wanted_furniture_item_id, index: true
  end
end
