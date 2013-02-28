class AddSlugToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :slug, :string
    add_index :galleries, :slug
  end
end
