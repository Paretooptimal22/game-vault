class AddStatusToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :status, :integer
  end
end
