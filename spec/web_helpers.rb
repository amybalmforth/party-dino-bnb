def signup_and_in
  visit('/signup')
  fill_in 'name', with: 'John Smith'
  fill_in 'username', with: 'JohnSmith'
  fill_in 'email', with: 'jsmith@gmail.com'
  fill_in 'password', with: 'backseatfreestyle'
  click_button('submit')
end
