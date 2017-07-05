require 'rails_helper'

RSpec.feature 'Users signing up' do
  let(:user) { FactoryGirl.build(:user) }

  before do
    visit '/'
    click_link 'Sign Up'
  end
  
  scenario 'succeeds with valid credentials' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content('a confirmation link has been sent to your email address')
  end
  
  scenario 'fails with invalid credentials' do
    click_button 'Sign up'
    expect(page).to have_content('prohibited this record from being saved')
  end
end
