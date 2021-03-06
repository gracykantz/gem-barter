class FurnitureItem < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # has_many :swipes
  # has_one :owner_swipe, class_name: "Swipe", foreign_key: 'owned_furniture_item_id', dependent: :destroy
  # has_one :other_swipe, class_name: "Swipe", foreign_key: 'wanted_furniture_item_id', dependent: :destroy
  has_many :owner_swipes, class_name: "Swipe", foreign_key: 'owned_furniture_item_id', dependent: :destroy
  has_many :other_swipes, class_name: "Swipe", foreign_key: 'wanted_furniture_item_id', dependent: :destroy
  has_many :images
  validates :title, presence: true
  validates :description, presence: true
  accepts_nested_attributes_for :images
end
