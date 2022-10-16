class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_many :carts
end
