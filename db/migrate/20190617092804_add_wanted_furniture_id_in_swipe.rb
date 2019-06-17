class AddWantedFurnitureIdInSwipe < ActiveRecord::Migration[5.2]
  def change
    add_column :swipes, :wanted_furniture_item_id, :integer
  end
end
