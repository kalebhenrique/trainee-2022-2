class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :is_admin, :wallet, :email, :profile_picture_url, :authentication_token

  has_many :carts
  def profile_picture_url
    rails_blob_path(object.profile_picture, only_path: true) if object.profile_picture.attached?
  end
end
