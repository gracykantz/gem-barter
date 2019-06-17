class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      # redirect_to home_page
    else
      # render new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio, :avatar, :average_rating, :location )
  end
end
