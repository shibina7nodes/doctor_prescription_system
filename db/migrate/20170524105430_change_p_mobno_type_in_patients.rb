class ChangePMobnoTypeInPatients < ActiveRecord::Migration[5.0]
  def change
  	change_column :patients, :p_mobno, :string
  end
end
