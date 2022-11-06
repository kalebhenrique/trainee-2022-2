class UserSerializer < ActiveModel::Serializer
  attributes :id, :is_admin, :wallet, :email, :authentication_token

  has_many :carts
end
