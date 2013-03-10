class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
    	t.integer :name

      t.timestamps
    end
  end
end
