require 'pg'
require 'web_helpers'

feature 'requesting spaces' do

  before(:each) do
    space = Spaces.create(name: 'home', description: 'urban area', price: '£50', available_from: 'November 18 2019', available_to: 'November 25 2019')
  end

  scenario 'user can request a space' do
    signup_and_in
    click_button 'Request'
    expect(page).to have_content 'Request'
  end

  scenario 'user can request a space' do
    signup_and_in
    click_button 'Request'
    click_button 'Confirm'
    expect(page).to have_content 'Your request has been confirmed'
  end

  scenario 'user can request a space' do
    signup_and_in
    click_button 'Request'
    click_button 'Back'
    expect(page).to have_content 'A list of all spaces'
  end
end
