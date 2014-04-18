require 'spec_helper'

feature "Admin::Games", type: :feature do
  scenario 'list games' do
    game = create(:game)

    visit admin_games_path
    expect(page).to have_content(game.category.name)
  end

  scenario 'create game' do
    category = create(:category)
    visit admin_games_path

    within('.well') do
      click_link 'Game'
    end

    select category.name, from: 'Category'
    attach_file 'Puzzle', 'spec/support/image.png'
    click_button 'Create'
    expect(page).to have_content('cadastrado(a) com sucesso')
    expect(page).to have_content(category.name)
  end

  scenario 'update game' do
    game = create(:game)
    new_category = create(:category, name: 'NewCategory')

    visit admin_games_path
    click_link 'Edit'
    select new_category.name, from: 'Category'
    click_button 'Update'
    expect(page).to have_content('editado(a) com sucesso')
    expect(page).to have_content(new_category.name)
  end

  scenario 'destroy game' do
    game = create(:game)

    visit admin_games_path
    click_link 'Destroy'
    expect(page).to have_content('excluído(a) com sucesso')
  end
end
