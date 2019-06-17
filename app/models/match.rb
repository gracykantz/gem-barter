class Match < ApplicationRecord
  has_many :messages
  has_one :swipe
end
