class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :lastname
      t.string :address
      t.references :employee_position, null: false, foreign_key: true
      t.string :email
      t.string :identifier
      t.string :mobile
      t.boolean :status

      t.timestamps
    end
  end
end
