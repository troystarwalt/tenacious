require 'rails_helper'

RSpec.describe InventoryUser, type: :model do
  it 'has valid factories' do
    expect(FactoryGirl.build(:inventory_user, :read)).to be_valid
    expect(FactoryGirl.build(:inventory_user, :write)).to be_valid
    expect(FactoryGirl.build(:inventory_user, :admin)).to be_valid
  end
end
