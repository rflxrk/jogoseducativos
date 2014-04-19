class HomeController < ApplicationController
  def index
    @games = Game.recent
  end
end
