require 'rails_helper'

RSpec.feature 'Visiting root route' do
  let(:user) { FactoryGirl.create(:user, :confirmed) }

  scenario 'as a guest to the site shows sign up and sign in links' do
    visit '/'
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
    expect(page).to have_link('Sign In', href: new_user_session_path)
    expect(page).not_to have_button('Sign Out')
  end

  scenario 'as a logged in user shows a log out link' do
    login_as(user)
    visit '/'
    expect(page).to have_button('Sign Out')
    expect(page).not_to have_link('Sign Up', href: new_user_registration_path)
    expect(page).not_to have_link('Sign In', href: new_user_session_path)
  end
end
