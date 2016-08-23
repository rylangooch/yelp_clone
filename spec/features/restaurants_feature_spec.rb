require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants should have been added' do
<<<<<<< HEAD
    scenario 'should display a promt to add a restaurant' do
=======
    scenario 'should display a prompt to add a restaurant' do
>>>>>>> c38fd22d2e595f409b5b4e3f0c95db55657d489f
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
end
<<<<<<< HEAD
=======

context 'restaurants have been added' do
  before do
    Restaurant.create(name: 'KFC')
  end

  scenario 'display restaurants' do
    visit '/restaurants'
    expect(page).to have_content('KFC')
    expect(page).not_to have_content('No restaurants yet')
  end
end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do

    let!(:kfc){ Restaurant.create(name: 'KFC') }

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do
    before { Restaurant.create name: 'KFC', description: 'Fatty chicken' }

    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'KFS'
      fill_in 'Description', with: 'Yummy chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'KFS'
      expect(page).to have_content 'Yummy chicken'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do

    before { Restaurant.create name: 'KFC', description: 'Fatty chicken' }

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end

  end
>>>>>>> c38fd22d2e595f409b5b4e3f0c95db55657d489f
