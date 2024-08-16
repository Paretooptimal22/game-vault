class RemoveCoversFromGames < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :covers, :string
  end
end
