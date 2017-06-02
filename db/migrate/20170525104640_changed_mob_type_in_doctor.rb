class ChangedMobTypeInDoctor < ActiveRecord::Migration[5.0]
  def change
  	change_column :doctors, :d_mobno, :string
  end
end
