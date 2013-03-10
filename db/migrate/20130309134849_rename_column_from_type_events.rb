class RenameColumnFromTypeEvents < ActiveRecord::Migration
  def change
  	rename_column :type_events, :type, :type_events
  end
end
