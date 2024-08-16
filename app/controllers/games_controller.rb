class GamesController < ApplicationController

  def index
    user_listings = current_user.listings.pluck(:game_id)
    @games = Game.joins(:listings).where.not(id: user_listings).distinct
    # @games = Game.where.associated(:listings).uniq
    if params[:query].present?
      @games = Game.search_by_game_genres_platforms_and_name(params[:query])
    end
  end

  def show
    @game = Game.find(params[:id])
    @rental = Rental.new
  end
end
