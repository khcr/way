class ChangeGalleriesUsers < ActiveRecord::Migration
  def change
    remove_column :users, :level_id, :integer
    add_column :users, :level, :integer
  end
end
