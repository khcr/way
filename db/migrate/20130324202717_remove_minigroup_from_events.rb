class RemoveMinigroupFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :minigroup
  end
end
