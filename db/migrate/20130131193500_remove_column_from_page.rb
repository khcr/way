class RemoveColumnFromPage < ActiveRecord::Migration
  def change
  	remove_column :pages, :ancestry
  	remove_column :pages, :parent_id
  end
end
