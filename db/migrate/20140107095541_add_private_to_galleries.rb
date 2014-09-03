class AddPrivateToGalleries < ActiveRecord::Migration
  def change
<<<<<<< HEAD
    add_column :galleries, :isPrivate, :boolean
=======
    add_column :galleries, :isprivate, :boolean, default: false
>>>>>>> 53e51685e5725d1f68490d1d477f7a6ccbd98d58
    add_column :galleries, :key, :string
  end
end
