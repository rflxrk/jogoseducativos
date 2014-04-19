class GamesController < ApplicationController
  def index
    @games = Game.recent
  end
end
