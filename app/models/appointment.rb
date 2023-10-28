class Appointment < ApplicationRecord
  belongs_to :order_detail
  belongs_to :employee
  belongs_to :appointment_state

  has_many :patient_histories
end
