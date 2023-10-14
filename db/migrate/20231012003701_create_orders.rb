class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :pacient, null: false, foreign_key: true
      t.datetime :sale_date
      t.decimal :total_order
      t.boolean :total_paid

      t.timestamps
    end
  end
end
