class AddPrivateToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :isprivate, :boolean, default: false
    add_column :galleries, :key, :string
  end
end
