class FurnitureItemsController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :delete]

  def index
    # show all furniture items
    @images = Image.all
    @swipes = Swipe.all

    if @swipes.count > 0
      # Call this method to remove the swiped records from the logged in user index list
      @furniture_items = update_furniture_items(@swipes)
    else
      @furniture_items = FurnitureItem.where.not('user_id = ?', current_user.id)
    end
  end

  # Call this method to remove the swiped records from the logged in user index list
  def update_furniture_items(swipesrec)
    furniture_items = FurnitureItem.all
    # Load swiped records
    swipearr = []
    swipesrec.each do |s|
      if s.owned_furniture_item_id == FurnitureItem.find_by_user_id(current_user.id).id
        swipearr << s.wanted_furniture_item_id
      end
    end
    # Remove swiped records from the furnitures index
    @furnitures = furniture_items.reject do |furniture_item|
      swipearr.include?(furniture_item.id)
    end
  end

  def new
    # Load a new furniture
    @furniture = FurnitureItem.new
    @furniture_image = @furniture.images.build
  end

  def create
    # Create the defined furniture
    @furniture = FurnitureItem.new(furniture_params)
    @furniture.user = current_user
    respond_to do |format|
      if @furniture.save
        params[:images]['photo'].each do |p|
          @furniture_image = @furniture.images.create!(photo: p, furniture_item_id: @furniture.id)
        end
        format.html { redirect_to @furniture, notice: 'Furniture successfully loaded for trade now.' }
      else
        format.html { render action: 'new' }
      end
    end
    # if @furniture.save
    #   redirect_to 'furniture_show_path' # update this line to actual path - By Shalini
    # else
    #   @furniture.errors.add(:base, 'Furniture details cannot be updated at this moment')
    #   render 'new'
    # end
  end

  def show
    # Show the Furniture and its Images
    @furniture = FurnitureItem.find(params[:id])
    @furniture_images = @furniture.images.all
  end

  def edit
    @images = @furniture.images.all
    # Authenticating for editing Furniture
    unless current_user.id == @furniture.user_id
      flash[:notice] = "You don't have access to edit the Furniture"
      redirect_to furniture_items_path
      return
    end
  end

  def update
    # Update the selected furniture
    @furniture = furniture_item.update(furniture_params)
    redirect_to furniture_item_path(@furniture) # define the redirection path later - By Shalini
  end

  def delete
    # Delete the selected furniture
    @furniture.destroy
    redirect_to furniture_items_path
  end

  private

  def set_furniture
    @furniture = FurnitureItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def furniture_params
    params.require(:furniture_item).permit(:title, :description, :user, images_attributes: [:id, :furniture_item_id, :photo])
  end
end
