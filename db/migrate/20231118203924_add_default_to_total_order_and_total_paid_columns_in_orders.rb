class AddDefaultToTotalOrderAndTotalPaidColumnsInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :total_order, from: nil, to: 0
    change_column_default :orders, :total_paid, from: nil, to: 0
  end
end
