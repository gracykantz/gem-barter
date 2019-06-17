class Category < ApplicationRecord
  has_many :furniture_items
  validates :name, presence: true
  validates :photo, presence: true
end
