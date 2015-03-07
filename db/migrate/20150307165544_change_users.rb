class ChangeUsers < ActiveRecord::Migration
  def change
    change_column :users, :level_id, :level
  end
end
