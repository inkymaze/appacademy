class ArtistIndex < ActiveRecord::Migration[5.0]
  def change

    add_index :artworks, :artist_id
    add_index :artwork_shares, :viewer_id
    add_index :artwork_shares, :artwork_id

  end
end
