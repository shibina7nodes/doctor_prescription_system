class CreatePrescriptns < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptns do |t|
      t.date :pres_date
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
      t.string :patient_reason
      t.references :medicine, foreign_key: true

      t.timestamps
    end
  end
end
