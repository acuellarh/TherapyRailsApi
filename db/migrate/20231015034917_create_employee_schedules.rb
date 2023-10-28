class CreateEmployeeSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_schedules do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :schedule_date
      t.string :schedule_day
      t.time :start_time
      t.time :end_time
      t.references :schedule_state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
