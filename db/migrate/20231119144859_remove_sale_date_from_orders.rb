class RemoveSaleDateFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :sale_date, :datetime
  end
end
