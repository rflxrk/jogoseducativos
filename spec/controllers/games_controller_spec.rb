require 'spec_helper'

describe GamesController do
  it_should_behave_like 'get success', action: :index, template: :index, assigns: 'games'
end
