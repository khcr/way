class Form < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :phone, :vendredi_soir, :vendredi_nuit, :samedi_midi, :samedi_soir, :samedi_nuit, :dimanche_midi

  validates :first_name, presence: true, length: { maximum: 55 }
  validates :last_name, presence: true, length: { maximum: 55 }
  validates :phone, presence: true, length: { maximum: 55 }
end
