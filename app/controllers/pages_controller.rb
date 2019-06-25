class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def myprofile
    current_user.id
    furniture_item = FurnitureItem.find_by_user_id(current_user.id)
    if furniture_item.nil?
      @trade = 'a'
    elsif !furniture_item.matched_to_id.nil?
      @trade = 'm'
      @match = Match.find_by(id: furniture_item.matched_to_id)
      if @match.traded == true
        @trade = 't'
      elsif @match.present?
        @trade = 'm'
      end
    elsif furniture_item.matched_to_id.nil?
      @trade = 'e'
    end
    # raise
  end
end
