class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_many :carts

  validates :name, :description, :brand, :category, presence: :true
  validates :name, uniqueness: :true
end
