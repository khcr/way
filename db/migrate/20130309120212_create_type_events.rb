class CreateTypeEvents < ActiveRecord::Migration
  def change
    create_table :type_events do |t|
      t.string :type

      t.timestamps
    end
  end
end
