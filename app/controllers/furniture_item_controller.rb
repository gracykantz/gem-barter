class FurnitureItemController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :delete]

  def index
    # show all furniture items
    @furniture = Furniture_Item.all
  end

  def new
    # Load a new furniture
    @furniture = Furniture_Item.new
  end

  def create
    # Create the defined furniture
    @furniture = Furniture_Item.new(furniture_params)
    @furniture.user = current_user
    if @furniture.save
      redirect_to 'furniture_show_path' # update this line to actual path - By Shalini
    else
      @furniture.errors.add(:base, 'Furniture details cannot be updated at this moment')
      render 'new'
    end
  end

  def edit
  end

  def update
    # Update the selected furniture
  end

  def delete
    # Delete the selected furniture
    @furniture.destroy
  end

  private

  def set_furniture
    @furniture = Furniture_Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def furniture_params
    params.require(:furniture_item).permit(:title, :description, :user)
  end
end
