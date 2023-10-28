class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :order_detail, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :appointment_state, null: false, foreign_key: true
      t.string :reason

      t.timestamps
    end
  end
end
