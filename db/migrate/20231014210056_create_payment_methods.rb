class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
