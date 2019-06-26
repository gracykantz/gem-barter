class Match < ApplicationRecord
  has_many :messages
  has_many :swipes

  # validate :only_one_match_per_swipe_pair

  # def only_one_match_per_swipe_pair
  #   unless swipes.empty?
  #     errors.add()
  #   end
  # end
end
