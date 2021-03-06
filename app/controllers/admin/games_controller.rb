class Admin::GamesController < Admin::AdminController
  inherit_resources
  actions :all, except: [:show]

  protected
    def game_params
      params.require(:game).permit(:category_id, :puzzle)
    end
end
