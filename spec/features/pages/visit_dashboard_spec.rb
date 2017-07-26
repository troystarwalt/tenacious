require 'rails_helper'
require 'features/feature_helpers'
include FeatureHelpers

RSpec.feature 'Visiting dashboard route' do
  scenario 'as a logged in user shows organizations the user belongs to' do
    user = FactoryGirl.create(:user, :confirmed)
    orgs = FactoryGirl.create_list(:organization, 2, users: [user])
    login_as(user)
    visit dashboard_path
    orgs.each do |org|
      expect(page).to have_link(org.name, href: organization_path(org))
    end
  end

  feature 'as a guest' do
    before do
      visit dashboard_path
    end

    will_redirect_to_login_page
  end
end
