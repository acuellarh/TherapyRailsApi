class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :product_category, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.boolean :status

      t.timestamps
    end
  end
end
