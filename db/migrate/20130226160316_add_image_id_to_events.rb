class AddImageIdToEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :image
  	add_column :events, :image_id, :integer
  end
end
