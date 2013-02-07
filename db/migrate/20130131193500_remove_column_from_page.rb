class RemoveColumnFromPage < ActiveRecord::Migration
  def change
  	remove_column :pages, :ancestry
  end
end
