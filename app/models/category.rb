class Category < ApplicationRecord
  has_many :furniture_items
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :photo, presence: true
end
