class FurnitureItemsController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :delete]

  def index
    # show all furniture items
    @furniture_items = FurnitureItem.all
    @images = Image.all
    @user = User.all
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
    #
    @furniture = FurnitureItem.find(params[:id])
    @furniture_images = @furniture.images.all
  end

  def edit
    @images = @furniture.images.all
  end

  def update
    # Update the selected furniture
    @furniture = furniture_item.update(furniture_params)
    redirect_to '' # define the redirection path later - By Shalini
  end

  def delete
    # Delete the selected furniture
    @furniture.destroy
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
