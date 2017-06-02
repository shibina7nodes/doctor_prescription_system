class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :patients, foreign_key: true
      t.references :doctors, foreign_key: true
      t.date :b_date

      t.timestamps
    end
  end
end
