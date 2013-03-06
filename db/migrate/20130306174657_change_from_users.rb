class ChangeFromUsers < ActiveRecord::Migration
  def change
  	change_column :users, :level, :integer
  end
end
