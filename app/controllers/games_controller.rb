class GamesController < ApplicationController
  def index
    @games = Game.recent.page params[:page]
  end

  def show
    @game = Game.find params[:id]
  end
end
