class AddSearchIndexToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :searchable_index, :tsvector
    add_index :games, :searchable_index, using: 'gin'
  end
end
