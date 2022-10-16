require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Testing factory" do
    it { expect(build(:product)).to be_valid }
  end

  context "Validating product name nil" do
    it " should be invalid" do
      expect(build(:product, name: nil)).to be_invalid
    end

    it " should be invalid if repeated" do
      create(:product, name: "Z Flip")
      expect(build(:product, name: "Z Flip")).to be_invalid
    end
  end

  context "Validating product description nil" do
    it " should be invalid" do
      expect(build(:product, description: nil)).to be_invalid
    end
  end
end
