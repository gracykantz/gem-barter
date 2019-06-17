class Swipe < ApplicationRecord
  belongs_to :owned_furniture_item, class_name: "FurnitureItem", foreign_key: :owned_furniture_item_id
  belongs_to :wanted_furniture_item, class_name: "FurnitureItem", foreign_key: :wanted_furniture_item_id
end
