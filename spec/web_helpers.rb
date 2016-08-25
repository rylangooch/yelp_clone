def sign_up(email: 'test@test.com')
  visit('/users/sign_up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def create_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  fill_in 'Description', with: 'Dutty chicken'
  click_button 'Create Restaurant'
end

def create_review
  click_link 'Review KFC'
  fill_in 'Thoughts', with: 'Not bad eh'
  select '3', from: 'Rating'
  click_button 'Leave Review'
end
