class AddDateExpToNews < ActiveRecord::Migration
  def change
  	add_column :news, :date_exp, :string
  	add_index :events, :date
  end
end
