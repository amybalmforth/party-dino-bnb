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
end
