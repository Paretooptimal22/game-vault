class GamesController < ApplicationController

  def index
    @games = Game.where.associated(:listings)

  end

  def show

  end
end
