class AddPrivateToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :isPrivate, :boolean
    add_column :galleries, :key, :string
  end
end
