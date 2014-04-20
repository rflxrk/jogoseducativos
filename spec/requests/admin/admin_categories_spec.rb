require 'spec_helper'

feature "Admin::Categories" do
  scenario 'list categories' do
    category = create(:category)

    visit admin_categories_path
    expect(page).to have_content(category.name)
  end

  scenario 'create category' do
    visit admin_categories_path

    within('.well') do
      click_link 'Category'
    end

    fill_in 'Name', with: attributes_for(:category)[:name]
    click_button 'Criar'
    expect(page).to have_content('cadastrado(a) com sucesso')
    expect(page).to have_content(attributes_for(:category)[:name])
  end

  scenario 'update category' do
    category = create(:category)
    new_name = 'NewName'

    visit admin_categories_path
    click_link 'Edit'
    fill_in 'Name', with: new_name
    click_button 'Atualizar'
    expect(page).to have_content('editado(a) com sucesso')
    expect(page).to have_content(new_name)
  end

  scenario 'destroy category' do
    category = create(:category)

    visit admin_categories_path
    click_link 'Destroy'
    expect(page).to have_content('excluído(a) com sucesso')
  end
end
