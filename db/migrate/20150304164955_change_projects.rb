class ChangeProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :slug
  end
end
