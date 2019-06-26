class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def myprofile
    @reviews = Review.where("user_reviewed_id = ?", current_user.id)
    # Logic for defining the distance - Added by Shalini
    @furniturematch = current_user.furniture_items.first.matched_to_id
    @swipe = Swipe.find_by(match_id: @furniturematch)
    if @swipe.present?
      if @swipe.owned_furniture_item.user.id == current_user.id
        @distance = Geocoder::Calculations.distance_between([current_user.latitude, current_user.longitude], [@swipe.wanted_furniture_item.user.latitude, @swipe.wanted_furniture_item.user.longitude])
        @distance = @distance.round(2)
      elsif @swipe.wanted_furniture_item.user.id == current_user.id
        @distance = Geocoder::Calculations.distance_between([current_user.latitude, current_user.longitude], [@swipe.owned_furniture_item.user.latitude, @swipe.owned_furniture_item.user.longitude])
        @distance = @distance.round(2)
      end
    end
    # raise
    # ENd of Addition
    @review = 0
    stars = 0
    if @reviews.count.positive?
      @reviews.each do |review|
        stars += review.review
      end
      @review = (stars / @reviews.count).round
    end

    # current_user.id
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
