require 'rails_helper'
 
RSpec.describe User, type: :model do
  it 'has valid factories' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe '#confirmed' do
    it 'is true in a confirmed user' do
      expect(FactoryGirl.build(:user, :confirmed).confirmed?).to be true
    end

    it 'is false in an unconfirmed user' do
      expect(FactoryGirl.build(:user).confirmed?).to be false
    end
  end
end
