class AddOrderStatusTypeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :order_status_type, null: false, foreign_key: true
  end
end
