class RenameDoctorsIdToDoctorId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :bookings, :doctors_id, :doctor_id
  end
end
