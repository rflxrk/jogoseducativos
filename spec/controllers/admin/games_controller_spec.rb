require 'spec_helper'

describe Admin::GamesController do
  it_should_behave_like 'get success', action: :index, template: :index
  it_should_behave_like 'new action', assigns: 'game'
  it_should_behave_like 'create action', valid: :game, invalid: :invalid_game, model: Game
  it_should_behave_like 'edit action', valid: :game
  it_should_behave_like 'update action', valid: :game, invalid: :invalid_game, model: Game
  it_should_behave_like 'destroy action', valid: :game, model: Game
end
