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

  describe '#user association' do
    it 'is valid when it has a user' do
      user = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:organization, users: [user])).to be_valid
    end

    it 'is valid when it has users' do
      users = FactoryGirl.create_list(:user, 2)
      expect(FactoryGirl.build(:organization, users: users)).to be_valid
    end
  end
end
