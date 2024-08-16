class ListingsController < ApplicationController
  def index
    @rentals = Rental.where.not(status: :active)
    @games = []
    @rentals.each do |rental|
      @games << rental.listing.game
    end
    @games = @games.uniq
  end

  def show
    @game = Game.find(params[:id])
    @listings = @game.listings
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
      redirect_to rentals_path
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
