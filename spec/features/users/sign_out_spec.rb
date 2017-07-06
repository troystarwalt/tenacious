require 'rails_helper'

RSpec.feature 'Users sign out' do
  let(:user) { FactoryGirl.create(:user, :confirmed) }

  scenario 'successfully' do
    login_as(user)
    visit '/'
    click_button 'Sign Out'
    expect(page).to have_content('Signed out successfully')
  end
end
