feature 'sign up' do
  scenario 'user wants to signup' do
    visit('/signup')
    fill_in 'name', with: 'John Smith'
    fill_in 'username', with: 'JohnSmith'
    fill_in 'email', with: 'jsmith@gmail.com'
    fill_in 'password', with: 'backseatfreestyle'
    click_button('submit')
    expect(page).to have_content 'Welcome to Jurassic Park, John Smith'
  end
end
