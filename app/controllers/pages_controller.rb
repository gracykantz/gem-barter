class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def myprofile
    current_user.id
    # raise
  end
end
