class GamesController < ApplicationController
  def index
    @games = Game.recent.page params[:page]
  end
end
