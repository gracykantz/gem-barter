class Swipe < ApplicationRecord
  belongs_to :owned_furniture_item, class_name: "FurnitureItem", foreign_key: :owned_furniture_item_id
  belongs_to :wanted_furniture_item, class_name: "FurnitureItem", foreign_key: :wanted_furniture_item_id
  has_many :matches
  # has_one :match, foreign_key: 'owned_swipe_id', dependent: :destroy
  # has_one :other_match, foreign_key: 'wanted_swipe_id', dependent: :destroy
end
