require 'pg'

feature 'edit spaces' do

  before(:each) do
    space = Space.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
  end

  scenario 'user can edit a space' do
    visit('/signup')
    fill_in 'name', with: 'John Smith'
    fill_in 'username', with: 'JohnSmith'
    fill_in 'email', with: 'jsmith@gmail.com'
    fill_in 'password', with: 'backseatfreestyle'
    click_button('submit')
    click_button 'Edit'
    expect(find_field('description').value).to eq 'urban area'
  end

  scenario 'edit can be saved' do
    signup_and_in
    visit('/spaces')
    click_button 'Edit'
    fill_in "name", with: 'bungalow'
    click_button 'update'
    expect(page).to have_content('bungalow')
  end

  scenario 'user can click the back button to go to the listings page' do
    signup_and_in
    click_button('Edit')
    click_button('Back')
    expect(page).to have_content('Welcome to Jurassic Park')
  end

end
