require 'rails_helper'
require 'web_helpers'

feature 'restaurants' do


  context 'User is logged in' do
    before do
      sign_up
    end

      context 'no restaurants should have been added' do
        scenario 'should display a prompt to add a restaurant' do
          visit '/restaurants'
          expect(page).to have_content 'No restaurants yet'
          expect(page).to have_link 'Add a restaurant'
        end
      end

      context 'restaurants have been added' do
        scenario 'display restaurants' do
          create_restaurant
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

      context 'an invalid restaurant' do
        it 'does not let you submit a name that is too short' do
          visit '/restaurants'
          click_link 'Add a restaurant'
          fill_in 'Name', with: 'kf'
          click_button 'Create Restaurant'
          expect(page).not_to have_css 'h2', text: 'kf'
          expect(page).to have_content 'error'
        end
      end
    end

    context 'viewing restaurants' do

      scenario 'lets a user view a restaurant' do
        create_restaurant
        restaurant = Restaurant.first.id
        visit '/restaurants'
        click_link 'KFC'
        expect(page).to have_content 'KFC'
        expect(current_path).to eq "/restaurants/#{restaurant}"
      end
    end

    context 'editing restaurants' do

      scenario 'let a user edit a restaurant' do
        create_restaurant
        visit '/restaurants'
        click_link 'Edit KFC'
        fill_in 'Name', with: 'KFC'
        fill_in 'Description', with: 'Yummy chicken'
        click_button 'Update Restaurant'
        expect(page).to have_content 'KFC'
        expect(page).to have_content 'Yummy chicken'
        expect(current_path).to eq '/restaurants'
      end
    end

    context 'deleting restaurants' do

      scenario 'removes a restaurant when a user clicks a delete link' do
        create_restaurant
        visit '/restaurants'
        click_link 'Delete KFC'
        expect(page).not_to have_content 'KFC'
        expect(page).to have_content 'Restaurant deleted successfully'
      end
    end
  end

    context 'user is not logged in' do
      scenario 'user tries to create a new restaurant' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        expect(page).to have_content 'Log in'
      end
    end

    context 'other users cant edit delete restaurants' do
      scenario 'only the user that created a restaurant can delete and edit restaurant' do
        sign_up
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'KFC'
        fill_in 'Description', with: 'Yummy chicken'
        click_button 'Create Restaurant'
        click_link 'Sign out'
        sign_up(email: 'test2@test.com')
        visit '/restaurants'
        click_link 'Edit'
        expect(page).to have_content 'Restaurant does not belong to this user'
      end
    end
end
