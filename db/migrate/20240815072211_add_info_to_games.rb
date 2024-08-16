class AddInfoToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :artworks, :text
    # add_column :games, :covers, :text
    add_column :games, :screenshots, :text
    add_column :games, :storyline, :text
    add_column :games, :summary, :text
    # add_column :games, :video_id, :text
  end
end
