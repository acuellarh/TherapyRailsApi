class PatientHistory < ApplicationRecord
  belongs_to :diagnosis
  belongs_to :appointment
end
