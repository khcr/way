class ChangerLevelFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :level
  	add_column :users, :level, :integer
  end
end
