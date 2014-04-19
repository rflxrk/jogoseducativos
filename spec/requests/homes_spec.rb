require 'spec_helper'

feature "Home" do
  scenario 'list games' do
    game = create(:game)

    visit root_path
    expect(page).to have_content(game.category.name)
  end
end
