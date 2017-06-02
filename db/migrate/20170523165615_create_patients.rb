class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :p_name
      t.string :p_gender
      t.string :p_address
      t.integer :p_age
      t.integer :p_mobno

      t.timestamps
    end
  end
end
