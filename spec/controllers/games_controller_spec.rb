require 'spec_helper'

describe GamesController do
  it_should_behave_like 'get success', action: :index, template: :index, assigns: 'games'

  it 'shows only 100 games per_page' do
    category = create(:category)

    # Creating 125 records
    125.times { create(:game, category: category) }

    # First page shows 100
    get :index
    expect(assigns(:games).count).to eq(100)

    # Second page shows 25
    get :index, page: 2
    expect(assigns(:games).count).to eq(25)
  end

  it '#shows successfully' do
    game = create(:game)

    get :show, id: game

    expect(response).to be_success
  end
end
