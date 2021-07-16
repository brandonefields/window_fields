class Artwork < ApplicationRecord
    has_many :user_artworks, dependent: :destroy
    has_many :users, through: :user_artworks

    has_one_attached :upload_image

    # validates :title, presence: true, uniqueness: true
end
