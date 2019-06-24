class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :status, inclusion: { in: ['Open', 'Closed'] }
end
