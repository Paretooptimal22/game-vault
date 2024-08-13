class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :age_rating
      t.float :aggregate_rating
      t.string :genres
      t.string :platforms
      t.string :cover
      t.string :name
      t.string :website

      t.timestamps
    end
  end
end
