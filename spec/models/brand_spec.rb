require 'rails_helper'

RSpec.describe Brand, type: :model do
  context "Testing factory" do
    it { expect(build(:brand)).to be_valid }
  end

  context "Validating brand name nil" do
    it " should be invalid" do
      expect(build(:brand, name: nil)).to be_invalid
    end

    it " should be invalid if repeated" do
      create(:brand, name: "Samsung")
      expect(build(:brand, name: "Samsung")).to be_invalid
    end
  end
end
