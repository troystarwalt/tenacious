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
end
