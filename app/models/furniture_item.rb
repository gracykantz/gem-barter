class FurnitureItem < ApplicationRecord
  belongs_to :user
  # has_many :swipes
  has_one :owner_swipe, class_name: "Swipe", foreign_key: 'owned_furniture_item_id', dependent: :destroy
  has_one :other_swipe, class_name: "Swipe", foreign_key: 'wanted_furniture_item_id', dependent: :destroy
  has_many :images
  accepts_nested_attributes_for :images
end
