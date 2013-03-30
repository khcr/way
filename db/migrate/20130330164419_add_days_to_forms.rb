class AddDaysToForms < ActiveRecord::Migration
  def change
  	remove_column :forms, :days
  	add_column :forms, :vendredi_soir, :string
  	add_column :forms, :vendredi_nuit, :string
  	add_column :forms, :samedi_midi, :string
  	add_column :forms, :samedi_soir, :string
  	add_column :forms, :samedi_nuit, :string
  	add_column :forms, :dimanche_midi, :string
  end
end
