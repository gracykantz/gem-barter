class FurnitureItemsController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :delete]

  def index
    # show all furniture items
    @images = Image.all
    @swipes = Swipe.all
    @user = User.all

    if @swipes.count > 0
      # Call this method to remove the swiped records from the logged in user index list
      @furniture_items = update_furniture_items(@swipes)
    else
      # @furniture_items = FurnitureItem.where.not('user_id = ?', current_user.id)
      @category = Category.find(params[:category_id])
      # raise
      # Always exclude items owned by the user for Furniture Index
      if !@category.nil? && @category.id != 1
        @furniture_items = FurnitureItem.where('category_id = ?', @category.id).where.not('user_id = ?', current_user.id)
        # raise
      else
        @furniture_items = FurnitureItem.where.not('user_id = ?', current_user.id)
        # raise
      end
    end

    # @user_furniture = FurnitureItem.where('user_id = ?', current_user.id)
    @user_furniture = FurnitureItem.find_by_user_id(current_user.id)
    if @user_furniture.nil?
      return
    end
  end

  # Call this method to remove the swiped records from the logged in user index list
  def update_furniture_items(swipesrec)
    @category = Category.find(params[:category_id])
    # raise
    # Always exclude items owned by the user for Furniture Index
    if !@category.nil? && @category.id != 1
      furniture_items = FurnitureItem.where('category_id = ?', @category.id).where.not('user_id = ?', current_user.id)
    else
      furniture_items = FurnitureItem.where.not('user_id = ?', current_user.id)
    end

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

  def mark_traded
    @furniture = FurnitureItem.find_by_user_id(current_user.id)
    @swipe = Swipe.find_by(owned_furniture_item_id: @furniture.id)
    if !@swipe.nil?
      @match = Match.find_by(id: @swipe.match_id)
      if !@match.nil?
        @match.update(traded: true)
        if @match.save!
          redirect_to myprofile_path
        end
      else
        redirect_to myprofile_path
      end
    else
      redirect_to myprofile_path
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
    @furniture.user_id = current_user.id
    respond_to do |format|
      if @furniture.save!
        params[:images]['photo'].each do |p|
          @furniture_image = @furniture.images.create!(photo: p, furniture_item_id: @furniture.id)
        end
        format.html { redirect_to myprofile_path, notice: 'Furniture successfully loaded for trade now.' }
      else
        redirect_to myprofile_path
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
    @category = Category.find(@furniture.category_id)
    # Authenticating for editing Furniture
    unless current_user.id == @furniture.user_id
      flash[:notice] = "You don't have access to edit the Furniture"
      redirect_to furniture_items_path
      return
    end
  end

  def update
    # Update the selected furniture
    # raise
    @furniture_item = @furniture.update(furniture_params)
    redirect_to categories_path # define the redirection path later - By Shalini
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
    params.require(:furniture_item).permit(:title, :description, :category_id, :user, images_attributes: [:id, :furniture_item_id, :photo])
  end
end
