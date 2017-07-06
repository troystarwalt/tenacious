require 'rails_helper'

RSpec.feature 'Users signing in' do
  let(:user) { FactoryGirl.create(:user, :confirmed) }

  before do
    visit '/'
    click_link 'Sign In'
  end
  
  scenario 'succeeds with valid credentials' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
  end
  
  scenario 'fails with invalid credentials' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
end
