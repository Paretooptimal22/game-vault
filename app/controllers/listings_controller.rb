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
  end
end
