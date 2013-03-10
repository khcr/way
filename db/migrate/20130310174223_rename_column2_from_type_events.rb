class RenameColumn2FromTypeEvents < ActiveRecord::Migration
  def change
  	rename_column :type_events, :type_events, :name
  end
end
