require 'spec_helper'

describe HomeController do
  it_should_behave_like 'get success', action: :index, template: :index, assigns: 'games'
end
