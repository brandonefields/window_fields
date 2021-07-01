class CreateUserArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_artworks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :artwork, null: false, foreign_key: true

      t.timestamps
    end
  end
end
