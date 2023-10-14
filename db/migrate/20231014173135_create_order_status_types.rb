class CreateOrderStatusTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :order_status_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
