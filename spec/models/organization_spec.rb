require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:organization)).to be_valid
  end

  describe '#name' do
    it 'is valid when under 256 characters' do
      expect(FactoryGirl.build(:organization, name: Faker::Lorem.characters(255))).to be_valid
    end

    it 'is invalid when nil' do
      expect(FactoryGirl.build(:organization, name: nil)).not_to be_valid
    end

    it 'is invalid when over 255 characters' do
      expect(FactoryGirl.build(:organization, name: Faker::Lorem.characters(256))).not_to be_valid
    end

    context 'uniqueness' do
      before do
        FactoryGirl.create(:organization, name: 'duplicate')
      end

      it 'is invalid with a duplicate organization' do
        expect(FactoryGirl.build(:organization, name: 'duplicate')).not_to be_valid
      end

      it 'is case insensitive' do
        expect(FactoryGirl.build(:organization, name: 'Duplicate')).not_to be_valid
      end
    end
  end

  describe '#owner' do
    it 'is invalid when nil' do
      expect(FactoryGirl.build(:organization, owner: nil)).not_to be_valid
    end

    it 'is a user' do
      organization = FactoryGirl.create(:organization)
      expect(organization.owner).to be_a(User)
    end
  end

  describe '#users' do
    it 'returns users belonging to the organization' do
      organization = FactoryGirl.create(:organization)
      users = FactoryGirl.create_list(:user, 2, organizations: [organization])
      expect(organization.users).to eq(users)
    end
  end
end
