class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :theme
      t.string :info
      t.string :president
      t.string :remarque
      t.string :orateur
      t.boolean :minigroup
      t.date :date

      t.timestamps
    end
  end
end
