class AddCategoryToFurnitureItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :furniture_items, :category, foreign_key: true
  end
end
