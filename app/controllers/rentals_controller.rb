class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    redirect_to rentals_path, status: :see_other
  end
end
