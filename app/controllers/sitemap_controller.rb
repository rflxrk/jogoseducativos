class SitemapController < ApplicationController
  def index
    @games = Game.recent
  end
end
