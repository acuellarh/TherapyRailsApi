class CreatePatientHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_histories do |t|
      t.references :diagnosis, optional: true, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.string :treatment_given
      t.integer :strength_scale
      t.integer :pain_scale
      t.integer :movement_scale

      t.timestamps
    end
  end
end
