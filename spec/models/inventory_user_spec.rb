require 'rails_helper'

RSpec.describe InventoryUser, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:inventory_user)).to be_valid
  end

  describe '#user_role' do
    let(:user_roles) { [:read, :write, :admin] }

    it 'is invalid when nil' do
      expect(FactoryGirl.build(:inventory_user, user_role: nil)).not_to be_valid
    end

    it 'is invalid outside of the enumerable range' do
      expect { FactoryGirl.build(:inventory_user, user_role: 3) }.to(
        raise_error(ArgumentError).with_message("'3' is not a valid user_role")
      )
    end

    it 'has a default of read' do
      inventory_user = FactoryGirl.build(:inventory_user)
      expect(inventory_user.user_role).to eq('read')
    end

    it 'has the right index' do
      user_roles.each_with_index do |user_role, index|
        expect(described_class.user_roles[user_role]).to eq(index)
      end
    end
  end
end
