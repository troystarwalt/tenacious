require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:inventory)).to be_valid
  end

  describe '#name' do
    it 'is valid when under 256 characters' do
      expect(FactoryGirl.build(:inventory, name: Faker::Lorem.characters(255))).to be_valid
    end

    it 'is invalid when nil' do
      expect(FactoryGirl.build(:inventory, name: nil)).not_to be_valid
    end

    it 'is invalid when over 255 characters' do
      expect(FactoryGirl.build(:inventory, name: Faker::Lorem.characters(256))).not_to be_valid
    end

    it 'is invalid with a duplicate value' do
      FactoryGirl.create(:inventory, name: 'duplicate')
      expect(FactoryGirl.build(:inventory, name: 'Duplicate')).not_to be_valid
    end
  end

  describe '#description' do
    it 'is valid when nil' do
      expect(FactoryGirl.build(:inventory, description: nil)).to be_valid
    end

    it 'is valid when under 256 characters' do
      expect(FactoryGirl.build(:inventory, description: Faker::Lorem.characters(255))).to be_valid
    end

    it 'is invalid when over 255 characters' do
      expect(FactoryGirl.build(:inventory, description: Faker::Lorem.characters(256))).not_to be_valid
    end
  end

  describe '#user association' do
    let(:inventory) { FactoryGirl.create(:inventory) }

    it 'is valid when it has a user' do
      user = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:inventory_user, :read, inventory: inventory, user: user)).to be_valid
    end

    it 'is valid when it has users' do
      users = FactoryGirl.create_list(:user, 2)
      users.each do |user|
        FactoryGirl.create(:inventory_user, :read, inventory: inventory, user: user)
      end
      expect(inventory.users).to eq users
    end
  end
end
