class SwipesController < ApplicationController
  def index
    # Fetch all swipes
    @swipes = Swipe.all
  end

  def new
    # Create new swipe record
    @swipe = Swipe.new
  end

  def create
    # Create a new Swipe record
  end

  def edit
    # Call the edit Swipe record
  end

  def update
    # Update the swipe record
    @swipe = Swipe.update(swipe_params)
  end

  private

  def swipe_params
    params.require(:swipe).permit(:liked, :own_furniture_item, :wanted_furniture_item)
  end
end
