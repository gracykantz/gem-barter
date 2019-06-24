class FurnitureItemsController < ApplicationController
  before_action :set_furniture, only: [:show, :edit, :update, :delete]
  skip_before_action :verify_authenticity_token
  # before_action :set_counter, only: [:update_swipes]

  def index
    # show all furniture items
    puts "again"
    @images = Image.all
    @swipes = Swipe.all
    @user = User.all
    # raise

    if @swipes.count > 0
      # Call this method to remove the swiped records from the logged in user index list
      @furniture_items = update_furniture_items(@swipes)
    else
      # @furniture_items = FurnitureItem.where.not('user_id = ?', current_user.id)
      @category = Category.find(params[:category_id])
      # raise
      # Always exclude items owned by the user for Furniture Index
      # raise
      if !@category.nil? && @category.name != "View All"
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
    # raise
  end

  # Call this method to remove the swiped records from the logged in user index list
  def update_furniture_items(swipesrec)
    @category = Category.find(params[:category_id])
    # raise
    # Always exclude items owned by the user for Furniture Index
    if !@category.nil? && @category.name != "View All"
      furniture_items = FurnitureItem.where('category_id = ?', @category.id).where.not('user_id = ?', current_user.id)
    else
      furniture_items = FurnitureItem.where.not('user_id = ?', current_user.id)
    end

    # Load swiped records
    swipearr = []
    myfurn = FurnitureItem.find_by_user_id(current_user.id)
    unless myfurn.nil?
      swipesrec.each do |s|
        if s.owned_furniture_item_id == FurnitureItem.find_by_user_id(current_user.id).id # && s.liked == false
          swipearr << s.wanted_furniture_item_id
        end
      end
      # Remove swiped records from the furnitures index
      @furnitures = furniture_items.reject do |furniture_item|
        swipearr.include?(furniture_item.id)
      end
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

  def destroy
    # Delete the selected furniture
    @furniture = FurnitureItem.find(params[:id])
    @images = Image.find_by_furniture_item_id(@furniture.id)
    @images.destroy
    @furniture.destroy
    redirect_to category_furniture_items_path
  end

  def update_swipes
    # puts "Hello"
    @direction = params[:direct]
    @furniture_id = params[:fid]
    @furniture_item = FurnitureItem.find(@furniture_id)
    # puts @direction
    # puts @furniture_item.title
    create_swipes(@direction, @furniture_item)
  end

  def create_swipes(direction, furniture)
  # Create swipe record
  @swipe = Swipe.new
  @furniture = FurnitureItem.find(furniture.id)
  @ownfurniture = FurnitureItem.find_by_user_id(current_user.id)
  # Create a new Swipe record
  @existswipes = Swipe.where('owned_furniture_item_id = ? AND wanted_furniture_item_id = ?', @ownfurniture.id, @furniture.id)
  puts "checking swipe"
  puts @existswipes.first.nil?
  puts @existswipes.last
  if @existswipes.first.nil?
    @swipe = Swipe.new(owned_furniture_item_id: @ownfurniture.id, wanted_furniture_item_id: @furniture.id)
    if direction.to_i.positive?
      @swipe.liked = true
    elsif direction.to_i.negative?
      @swipe.liked = false
    end
    # Call method to udpate Owned/ wanted furniture item id on created Swipe record
    @swipe = update_furniture_item_id(@swipe, @furniture)
    unless @swipe.wanted_furniture_item_id.nil?
      if @swipe.save
        # Find all existing Swipe records
        @matchrec = create_match(@swipe)
        puts "creating match"
        puts !@matchrec.nil?
        if !@matchrec.nil?
          # @swipe.match_id = @matchrec.id
          @swipe.update(match_id: @matchrec.id)
          # create chat Room
          chat_room = ChatRoom.create!(name: "#{@ownfurniture.user.first_name} - #{@furniture.user.first_name}", status: 'Open')
          puts "print swipe matched record"
          puts @matchrec.id
          puts @swipe.match_id
          # @swipe.save!
        end
        #@category_id = params[:category_id]
        # redirect_to category_furniture_items_path(@furniture.category_id) # update the rendering path
      end
    end
  # render js: "window.location.reload()"
  end
  # logic to delete the duplicate swipe created on post call
  puts "own furniture id"
  puts @ownfurniture.id
  puts "wanted furniture id"
  puts @furniture.id
  @existswipes = Swipe.where('owned_furniture_item_id = ? AND wanted_furniture_item_id = ?', @ownfurniture.id, @furniture.id)
  puts @existswipes.length
  if @existswipes.length > 1
  @delswipe = @existswipes.last
  @delswipe.destroy!
  end

  @matches = Match.all
  @matches.each do |m|
    @existmatch = Swipe.where('match_id = ?', m.id)
    if @existmatch.first.nil?
      m.destroy!
    end
  end

  redirect_to category_furniture_items_path(@furniture.category_id)
  end

  def update_furniture_item_id(swipe, furn)
    # Find the Furniture item id for the current furniture
    # @furnitureitem = FurnitureItem.find(furn.id)
    # Find the Furniture item id owned by the Current user logged in
    @usrfurnitureitm = FurnitureItem.find_by_user_id(current_user.id)
    if furn.user_id == current_user.id
      swipe.owned_furniture_item_id = furn.id
    else
      swipe.wanted_furniture_item_id = furn.id
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
      # @existswipes.match_id = @match.id
      @existswipes.each do |s|
        s.update(match_id: @match.id)
      end
    end
    return @match
  end

  private

  def set_furniture
    @furniture = FurnitureItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def furniture_params
    params.require(:furniture_item).permit(:title, :description, :category_id, :user, images_attributes: [:id, :furniture_item_id, :photo])
  end

  # def swipe_params
  #   params.require(:swipe).permit(:liked, :own_furniture_item, :wanted_furniture_item)
  # end
end
