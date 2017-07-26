require 'rails_helper'
require 'features/feature_helpers'
include FeatureHelpers

RSpec.feature 'Creating an organization' do
  let(:user) { FactoryGirl.create(:user, :confirmed) }
  let(:organization) { FactoryGirl.build(:organization, owner: user, users: [user]) }

  feature 'as an authenticated user' do
    let!(:original_organization_count) { Organization.count }

    before do
      login_as(user)
      visit '/'
      click_link 'Dashboard'
      click_link 'Create an Organization'
    end

    feature 'with valid inputs' do
      before do
        fill_in 'organization_name', with: organization.name
        click_button 'Create Organization'
      end

      scenario 'succeeds and redirects to organization path' do
        created_organization = Organization.last
        expect(Organization.count - original_organization_count).to be(1)
        expect(created_organization.owner).to eq(organization.owner)
        expect(created_organization.users).to eq(organization.users)
        expect(created_organization.name).to eq(organization.name)
        expect(current_path).to eq(organization_path(created_organization))
      end

      scenario 'shows a message saying the organization was created' do
        expect(page).to have_content('Your organization has been successfully created')
      end
    end

    feature 'with no inputs' do
      before do
        click_button 'Create Organization'
      end

      scenario 'fails' do
        expect(Organization.count).to eq(original_organization_count)
      end

      scenario 'shows messages saying why the organization was not created' do
        expect(page).to have_content("Name can't be blank")
      end
    end
  end

  feature 'as a guest' do
    before do
      visit new_organization_path
    end

    will_redirect_to_login_page
  end
end
