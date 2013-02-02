class RenameTypeFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :type
  	add_column :events, :type_soiree, :string
  end
end
