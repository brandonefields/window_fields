class Artwork < ApplicationRecord
    has_many :user_artworks
    has_many :users, through: :user_artworks

    validates :title, presence: true, uniqueness: true
end
