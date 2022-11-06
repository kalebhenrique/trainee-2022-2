class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_many :carts, dependent: :destroy

  validates :name, :inventory, :price_in_cents, :description, :brand, :category, presence: :true
  validates :name, uniqueness: :true
  validates :inventory, :price_in_cents, numericality: { only_integer: true, :greater_than_or_equal_to => 0}
  has_many_attached :images
end
