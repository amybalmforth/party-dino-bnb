require 'pg'

feature 'edit spaces' do

  before(:each) do
    space = Spaces.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
  end

  scenario 'user can edit a space' do
    conn = PG.connect(dbname: 'party_dino_bnb_test')
    visit('/spaces')
    click_button 'Edit'
    expect(page).to have_content('urban area')
  end
end
