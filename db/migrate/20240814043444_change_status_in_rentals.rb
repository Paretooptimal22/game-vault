class ChangeStatusInRentals < ActiveRecord::Migration[7.1]
  def change
    # Remove the old status column
    remove_column :rentals, :status, :boolean

    # Add the new status column as an array of strings
    add_column :rentals, :status, :string, array: true, default: ['pending']
  end
end
