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

    it 'is invalid with a duplicate organization' do
      org = FactoryGirl.create(:organization, name: 'duplicate')
      expect(FactoryGirl.build(:organization, name: 'duplicate')).not_to be_valid
    end
  end
end
