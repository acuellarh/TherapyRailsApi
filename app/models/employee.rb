class Employee < ApplicationRecord
  belongs_to :employee_position
  has_many :employee_schedules
  has_many :appointments
end
