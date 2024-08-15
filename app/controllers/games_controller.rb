class GamesController < ApplicationController
  def index
    if params[:query].present?
      @games = Game.search_by_name_genres_platforms(params[:query])
    else
      @games = Game.all
    end
  end
end
