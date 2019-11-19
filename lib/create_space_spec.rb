feature "creating a space" do
  scenario "welcomes the user" do
    visit('/')
    expect(page).to have_content('Welcome to Dinosaur BNB!')
  end

  scenario "can click through to list properties page" do
    visit('/signup')
    fill_in 'name', with: 'John Smith'
    fill_in 'username', with: 'JohnSmith'
    fill_in 'email', with: 'jsmith@gmail.com'
    fill_in 'password', with: 'backseatfreestyle'
    click_button('submit')
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

  scenario "property owner can click submit to list a property" do
    visit('/create')
    within('form') {
      expect(page).to have_button('Submit')
    }
  end

  scenario "property owner can fill in information and then view it on the listings page" do
    visit ('/create')
    fill_in 'property_name', with: 'Dino mansion'
    fill_in 'description', with: 'A beautiful party mansion for all your party dinosaur needs'
    fill_in 'price_per_night', with: '£100'
    fill_in 'available_from', with: '31/12/2019'
    fill_in 'available_to', with: '01/02/2020'
    click_button('Submit')
    expect(page).to have_content('Dino mansion')
    expect(page).to have_content('A beautiful party mansion for all your party dinosaur needs')
    expect(page).to have_content('£100')
    expect(page).to have_content('31/12/2019')
    expect(page).to have_content('01/02/2020')
  end


end
