class ListingsController < ApplicationController
  def index
    @rentals = Rental.all
    @listings = Rental.where(@rentals.each { |rental| rental.status.pending? })
    # @listings = @listings.where(@listings.each { |listing| listing.status != listing.approved })
  end

  def show
    @listings = Listing.all
    @listing = Listing.find(params[:id])
    @rental = Rental.new
  end
end
