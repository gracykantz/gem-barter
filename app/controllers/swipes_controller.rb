class SwipesController < ApplicationController
  def index
    # Fetch all swipes
    @swipes = Swipe.all
  end

  def new
    # Create new swipe record
    @swipe = Swipe.new
    @furniture = FurnitureItem.find(params[:furniture_item_id])
    # raise
  end

  def create
    # Create a new Swipe record
    @swipe = Swipe.new(swipe_params)
    # Call method to udpate Owned/ wanted furniture item id on created Swipe record
    @swipe = update_furniture_item_id(@swipe)
    unless @swipe.wanted_furniture_item_id.nil?
      if @swipe.save
        # Find all existing Swipe records

        @matchrec = create_match(@swipe)
        if !@matchrec.nil?
          @swipe.match_id = @matchrec.id
          @swipe.save!
        end

        @category_id = params[:category_id]
        redirect_to category_furniture_items_path(@category_id) # update the rendering path
      end
    end
  end

  def update_furniture_item_id(swipe)
    # Find the Furniture item id for the current furniture
    @furnitureitem = FurnitureItem.find(params[:furniture_item_id])
    # Find the Furniture item id owned by the Current user logged in
    @usrfurnitureitm = FurnitureItem.find_by_user_id(current_user.id)
    if @furnitureitem.user_id == current_user.id
      swipe.owned_furniture_item_id = @furnitureitem.id
    else
      swipe.wanted_furniture_item_id = @furnitureitem.id
      swipe.owned_furniture_item_id = @usrfurnitureitm.id
    end
    return swipe
  end

  def create_match(swipe)
    # Fetch all the swipes from the table where owned furniture item id = current swipe wanted furniture item id
    # and matched_id is nil (means no match created yet) and liked = true
    @existswipes = Swipe.where(" (owned_furniture_item_id = ? AND wanted_furniture_item_id = ?)
      AND liked = ?", swipe.wanted_furniture_item_id, swipe.owned_furniture_item_id, true)
    # If such Swipe record exist, create a match
    if @existswipes.count > 0
      @match = Match.new
      @match = Match.create!(traded: true)
      @existswipes.match_id = @match.id
      @existswipes.save!
    end
    return @match
  end

  def edit
    # Call the edit Swipe record
  end

  def update
    # Update the swipe record
    @swipe = Swipe.update(swipe_params)
    if @swipe.save
      redirect_to ''  # update the rendering path
    end
  end

  private

  def swipe_params
    params.require(:swipe).permit(:liked, :own_furniture_item, :wanted_furniture_item)
  end
end
