class Review < ApplicationRecord
  belongs_to :user_reviewing, class_name: "User", foreign_key: :user_reviewing_id
  belongs_to :user_reviewed, class_name: "User", foreign_key: :user_reviewed_id

  validates :review, inclusion: { in: 0..5 }
end
