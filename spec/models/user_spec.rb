require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe '#password' do
    it 'is invalid when nil' do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end

    it 'is invalid when under 14 characters' do
      expect(FactoryGirl.build(:user, password: Faker::Internet.password(1, 13))).not_to be_valid
    end

    it 'is valid when between 14 and 128 characters' do
      expect(FactoryGirl.build(:user, password: Faker::Internet.password(14, 128))).to be_valid
    end
  end

  describe '#confirmed' do
    it 'is true in a confirmed user' do
      expect(FactoryGirl.build(:user, :confirmed).confirmed?).to be true
    end

    it 'is false in an unconfirmed user' do
      expect(FactoryGirl.build(:user).confirmed?).to be false
    end
  end

  describe '#inventories' do
    it 'returns inventories it belongs to' do
      user = FactoryGirl.create(:user)
      inventories = FactoryGirl.create_list(:inventory, 2, users: [user])
      expect(user.inventories).to eq(inventories)
    end
  end

  describe '#organizations' do
    it 'returns organizations it belongs to' do
      user = FactoryGirl.create(:user)
      orgs = FactoryGirl.create_list(:organization, 2, users: [user])
      expect(user.organizations).to eq(orgs)
    end
  end

  describe '#owned_organizations' do
    it 'returns organizations it owns' do
      user = FactoryGirl.create(:user)
      orgs = FactoryGirl.create_list(:organization, 2, owner: user)
      expect(user.owned_organizations).to eq(orgs)
    end
  end
end
