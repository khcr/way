class RemoveSamediSoir < ActiveRecord::Migration
  def change
  	remove_column :forms, :samedi_soir
  end
end
