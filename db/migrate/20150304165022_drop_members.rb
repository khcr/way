class DropMembers < ActiveRecord::Migration
  def change
    drop_table :members
    drop_table :type_events
    drop_table :levels
  end
end
