class ChangeGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :slug
    remove_column :galleries, :key
  end
end
