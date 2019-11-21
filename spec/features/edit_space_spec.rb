require 'web_helpers'

feature 'edit spaces' do

  let(:user) { double(:user) }

  before(:each) do
    allow(user).to receive(:id).and_return(1)
  end

  scenario 'user can edit a space' do
    # conn = PG.connect(dbname: 'party_dino_bnb_test')
    signup_and_in
    create_new_listing
    click_button 'Edit'
    expect(find_field('description').value).to eq 'urban area'
  end

  # scenario 'edit can be saved' do
  #   conn = PG.connect(dbname: 'party_dino_bnb_test')
  #   visit('/spaces')
  #   click_button 'Edit'
  #   fill_in "name", with: 'bungalow'
  #   click_button 'update'
  #   expect(page).to have_content('bungalow')
  # end

  scenario 'user can click the back button to go to the listings page' do
    signup_and_in
    create_new_listing
    click_button('Edit')
    click_button('Back')
    expect(page).to have_content('Welcome to Jurassic Park')
  end

end
