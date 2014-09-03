class UpdateForms < ActiveRecord::Migration
  def change
  	change_table(:forms) do |t|
  		t.remove :vendredi_soir
  		t.remove :vendredi_nuit
  		t.remove :samedi_nuit
  		t.remove :samedi_midi
  		t.remove :samedi_matin
  		t.remove :dimanche_midi
      t.text :notice
  	end
  end
end
