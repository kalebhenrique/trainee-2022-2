require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it { expect(build(:category)).to be_valid }
  end

  context "Validating category name nil" do
    it " should be invalid" do
      expect(build(:category, name: nil)).to be_invalid
    end

    it " should be invalid if repeated" do
      create(:category, name: "Celulares")
      expect(build(:category, name: "Celulares")).to be_invalid
    end
  end
end