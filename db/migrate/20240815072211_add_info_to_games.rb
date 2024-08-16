class AddInfoToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :artworks, :text
    add_column :games, :screenshots, :text
    add_column :games, :storyline, :text
    add_column :games, :summary, :text
  end
end
