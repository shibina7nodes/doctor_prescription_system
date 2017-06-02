class CreateMedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :medicines do |t|
      t.string :medicine_name
      t.float :price
      t.string :company_name

      t.timestamps
    end
  end
end
