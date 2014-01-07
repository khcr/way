class AddPrivateToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :isPrivate, :boolean, default: false
    add_column :galleries, :key, :string
  end
end
