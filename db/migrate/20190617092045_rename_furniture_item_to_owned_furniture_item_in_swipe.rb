class RenameFurnitureItemToOwnedFurnitureItemInSwipe < ActiveRecord::Migration[5.2]
  def change
    rename_column :swipes, :furniture_item_id, :owned_furniture_item_id
  end
end
