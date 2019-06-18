class FurnitureItem < ApplicationRecord
  belongs_to :user
  # has_many :swipes
  has_one :swipe, foreign_key: 'owned_furniture_item_id', dependent: :destroy
  has_one :swipe, foreign_key: 'wanted_furniture_item_id', dependent: :destroy
  has_many :images
  accepts_nested_attributes_for :images
end
