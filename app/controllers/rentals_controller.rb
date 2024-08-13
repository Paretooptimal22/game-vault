class RentalsController < ApplicationController
   def index
    @rentals = Rental.all
  end
  
  def new
    @rental = Rental.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @rental = Rental.new(rental_params)
    @rental.listing = @listing
    @rental.user = current_user
    if @rental.save
      redirect_to rentals_path
    else
      # show the form again but with the @rental in this method
      render 'listings/show', status: :unprocessable_entity
    end
  end


  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    redirect_to rentals_path, status: :see_other
  end
  
  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :listing_id)
  end
end
