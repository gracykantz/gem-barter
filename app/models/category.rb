class Category < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :furniture_items
  validates :name, presence: true
  validates :photo, presence: true
end
