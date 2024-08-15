class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @rental = Rental.new
  end

  def new
    @listing = Listing.new
    @games = Game.all
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to @listing
    else
      @games = Game.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:price, :game_id)
  end
end
