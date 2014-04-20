class GamesController < ApplicationController
  def index
    @games = Game.includes(:category).recent.page params[:page]
  end

  def show
    @game = Game.find params[:id]
    @related_games = Game.recent.where('created_at < ?', @game.created_at).limit(6)
  end
end
