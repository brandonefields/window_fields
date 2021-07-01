class Artwork < ApplicationRecord
    has_many :user_artworks, dependent: :destroy
    has_many :users, through: :user_artworks

    validates :title, presence: true, uniqueness: true
end
