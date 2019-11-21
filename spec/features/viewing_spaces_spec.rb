feature 'Viewing Spaces' do

  scenario 'user can see spaces' do
    conn = PG.connect(dbname: 'party_dino_bnb_test')

    Space.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
    Space.create(name: 'house', description: 'rural area', price: '£40', available_from: 'November 20 2019', available_to: 'November 30 2019')

    visit('/spaces')

    expect(page).to have_content "home" && "urban area" && "£50" && "November 25 2019" && "November 18 2019"
    expect(page).to have_content "house" && "rural area" && "£40" && "November 20 2019" && "November 30 2019"
  end

  scenario 'user can log out' do
    signup_and_in
    click_button('Logout')
    expect(page).to have_content("Welcome to Dinosaur BNB!")
  end

end
