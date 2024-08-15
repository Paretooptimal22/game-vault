class ChangeStatusToEnumInRentals < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing 'status' column
    remove_column :rentals, :status, :string, array: true, default: ["pending"]

    # Add the new 'status' column as an integer with a default value
    add_column :rentals, :status, :integer, default: 0
  end
end
