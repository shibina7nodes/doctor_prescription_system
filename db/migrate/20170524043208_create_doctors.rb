class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :d_name
      t.string :d_gender
      t.string :d_address
      t.integer :d_mobno
      t.string :d_specialize

      t.timestamps
    end
  end
end
