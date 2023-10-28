class EmployeeSchedule < ApplicationRecord
  belongs_to :employee
  belongs_to :schedule_state
end
