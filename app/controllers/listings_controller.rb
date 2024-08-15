class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    if params[:query].present?
      @listings = Listing.search_by_game_genres_platforms_and_name(params[:query])
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @rental = Rental.new
  end
end
