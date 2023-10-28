class ChangeDiagnosisColumnInPatientHistory < ActiveRecord::Migration[6.1]
  def change
    change_column :patient_histories, :diagnosis_id, :bigint, null:true
  end
end
