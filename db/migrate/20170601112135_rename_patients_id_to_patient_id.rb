class RenamePatientsIdToPatientId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :bookings, :patients_id, :patient_id
  end
end
