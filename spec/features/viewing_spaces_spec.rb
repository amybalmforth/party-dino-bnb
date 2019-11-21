feature 'Viewing Spaces' do

  let(:user) { double(:user) }

  scenario 'user can see spaces' do
    allow(user).to receive(:id).and_return(1)
    conn = PG.connect(dbname: 'party_dino_bnb_test')

    Spaces.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019', created_by: user.id)
    Spaces.create(name: 'house', description: 'rural area', price: '£40', available_from: 'November 20 2019', available_to: 'November 30 2019', created_by: user.id)

    visit('/spaces')

    expect(page).to have_content "home" && "urban area" && "£50" && "November 25 2019" && "November 18 2019"
    expect(page).to have_content "house" && "rural area" && "£40" && "November 20 2019" && "November 30 2019"
  end
end
