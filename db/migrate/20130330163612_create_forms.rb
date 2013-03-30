class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :days

      t.timestamps
    end
  end
end
