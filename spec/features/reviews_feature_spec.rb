require 'rails_helper'

feature 'reviewing' do
  before do
    sign_up
    create_restaurant
  end
  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  scenario 'allows users to edit their review' do
    visit '/restaurants'
    click_link 'KFC'
    click_link 'Edit Review'
    fill_in "Thoughts", with: 'Tremendous chicken'
    select '5', from: 'Rating'
    click_button 'Edit Review'
    expect(page).to have_content('Tremendous chicken')
  end

end
