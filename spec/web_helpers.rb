def signup_and_in
  visit('/signup')
  fill_in 'name', with: 'John Smith'
  fill_in 'username', with: 'JohnSmith'
  fill_in 'email', with: 'jsmith@gmail.com'
  fill_in 'password', with: 'backseatfreestyle'
  click_button('submit')
end

def create_space
  visit ('/create')
  fill_in 'property_name', with: 'Dino mansion'
  fill_in 'description', with: 'A beautiful party mansion for all your party dinosaur needs'
  fill_in 'price_per_night', with: '£100'
  fill_in 'available_from', with: '31/12/2019'
  fill_in 'available_to', with: '01/02/2020'
  click_button('Submit')
end
