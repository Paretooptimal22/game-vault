# ListingsController
class ListingsController < ApplicationController
  def update_status
    @listing = Listing.find(params[:id])

    if @listing.update(status: params[:status])
      redirect_to listings_path, notice: "Listing status updated to #{params[:status].capitalize}."
    else
      redirect_to listings_path, alert: "Failed to update listing status."
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    if @listing.destroy
      redirect_to listings_path, notice: "Listing has been deleted."
    else
      redirect_to listings_path, alert: "Failed to delete listing."
    end
  end
end
