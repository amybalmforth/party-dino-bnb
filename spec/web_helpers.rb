def signup_and_in
  visit('/signup')
  fill_in 'name', with: 'John Smith'
  fill_in 'username', with: 'JohnSmith'
  fill_in 'email', with: 'jsmith@gmail.com'
  fill_in 'password', with: 'backseatfreestyle'
  click_button('submit')
end

def create_new_listing
  click_button 'create_new_listing'
  fill_in 'property_name', with: 'home'
  fill_in 'description', with: 'urban area'
  fill_in 'price_per_night', with: '£50'
  fill_in 'available_from', with: '18/11/2019'
  fill_in 'available_to', with: '25/11/2019'
  click_button 'Submit'
end
