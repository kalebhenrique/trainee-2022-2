class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :carts, dependent: :destroy
    validates :wallet, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]
    validates :wallet, numericality: { only_integer: true, :greater_than_or_equal_to => 0}
end
