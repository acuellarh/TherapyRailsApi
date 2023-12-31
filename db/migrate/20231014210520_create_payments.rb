class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true
      t.decimal :amount
      t.string :payment_support_url
      t.date :date

      t.timestamps
    end
  end
end
