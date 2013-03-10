class AddTypeEventsIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :type_events_id, :integer
  end
end
