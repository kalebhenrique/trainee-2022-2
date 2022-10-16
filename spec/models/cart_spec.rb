require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "Testing factory" do
    it { expect(build(:cart)).to be_valid }
  end

  context "Validating user" do
    it " should be invalid if nil" do
      expect(build(:cart, user: nil)).to be_invalid
    end

    it " should be invalid if doesn't exist" do
      expect(build(:cart, user_id: -1)).to be_invalid
    end
  end

  context "Validating product" do
    it " should be invalid if nil" do
      expect(build(:cart, product: nil)).to be_invalid
    end

    it " should be invalid if doesn't exist" do
      expect(build(:cart, product_id: -1)).to be_invalid
    end
  end
end
