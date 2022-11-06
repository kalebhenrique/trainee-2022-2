class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price_in_cents

  has_one :brand
  has_one :category

  has_many :carts
end
