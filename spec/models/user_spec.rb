require 'rails_helper'

RSpec.describe User, type: :model do
  context "Testing factory" do
    it { expect(build(:user)).to be_valid }
    it { expect(build(:user, :admin)).to be_valid }
  end

  context "Validating wallet" do
    it " should be invalid if nil" do
      expect(build(:user, wallet: nil)).to be_invalid
    end
    it " should be invalid if double" do
      expect(build(:user, wallet: 1.1)).to be_invalid
    end
  end

  context "Validating is_admin" do
    it " should be invalid if nil" do
      expect(build(:user, is_admin: nil)).to be_invalid
    end
    it " should be valid if false" do
      expect(build(:user, is_admin: false)).to be_valid
    end
  end
end