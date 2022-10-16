class User < ApplicationRecord
    has_many :carts
    validates :wallet, presence: :true
    validates :is_admin, inclusion: [true, false], exclusion: [nil]
    validates :wallet, numericality: { only_integer: true}
end
