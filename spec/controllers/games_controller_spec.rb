require 'spec_helper'

describe GamesController do
  it_should_behave_like 'get success', action: :index, template: :index, assigns: 'games'

  it 'shows only 100 games per_page' do
    category = create(:category)

    # Creating 125 records
    125.times { create(:game, category: category) }

    # First page shows 96
    get :index
    expect(assigns(:games).count).to eq(96)

    # Second page shows 29
    get :index, page: 2
    expect(assigns(:games).count).to eq(29)
  end

  it '#show successfully' do
    game = create(:game)

    get :show, id: game

    expect(response).to be_success
  end

  it 'assigns @related_games' do
    game = create(:game)

    get :show, id: game
    expect(assigns(:related_games)).to be_a(ActiveRecord::Relation)
  end
end
