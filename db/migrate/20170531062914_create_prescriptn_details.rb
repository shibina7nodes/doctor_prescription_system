class CreatePrescriptnDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptn_details do |t|
    	t.references :prescriptn, foreign_key: true
      t.string :medicine_name
      t.integer :medicine_count
      t.integer :days
      t.integer :tyms

      t.timestamps
    end
  end
end
