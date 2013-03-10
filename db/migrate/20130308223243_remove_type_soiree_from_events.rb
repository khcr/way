class RemoveTypeSoireeFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :type_soiree
  end
end
