class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
