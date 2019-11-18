feature "creating a space" do
  scenario "welcomes the user" do
    visit('/')
    expect(page).to have_content('Welcome to Dinosaur BNB!')
  end

  scenario "can click through to list properties page" do
    visit('/')
    click_button('Create new listing')
    expect(page).to have_content('List your property')
  end

  scenario "can see a form for entering property details" do
    visit('/create')
      within('form') {
        expect(page).to have_content('Property Name')
        expect(page).to have_content('Description')
        expect(page).to have_content('Price per night')
        expect(page).to have_content('Available from')
        expect(page).to have_content('Available to')
      }
  end


end
