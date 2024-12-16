require 'rails_helper'

RSpec.describe 'User Signup', type: :system do
  it 'allows a user to sign up' do
    visit signup_path
    fill_in 'Username', with: 'newuser'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign Up'

    # Check that the user is redirected to the login page after sign up
    expect(page).to have_current_path(login_path)

    # Check if the login form is displayed
    expect(page).to have_content('Login')
  end
end
