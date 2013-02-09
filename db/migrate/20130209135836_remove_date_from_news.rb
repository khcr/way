class RemoveDateFromNews < ActiveRecord::Migration
  def change
  	remove_column :news, :date_exp
  	add_column :news, :date_exp, :date
  end
end
