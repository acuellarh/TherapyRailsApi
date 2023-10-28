class Diagnosis < ApplicationRecord
  has_many :patient_histories
end
