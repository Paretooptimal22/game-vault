class UpdateStatusInRentals < ActiveRecord::Migration[7.1]
  def change
    remove_column :rentals, :status, :string, array: true, default: ["pending"]
    add_column :rentals, :status, :integer, default: 0
  end
end
