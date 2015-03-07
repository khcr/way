class ChangeEvents < ActiveRecord::Migration
  def change
    change_table(:events) do |t|
      t.remove :theme
      t.remove :orateur
      t.remove :type_events_id
      t.remove :slug
      t.remove :image_id
      t.rename :info, :content
      t.boolean :remove, default: false
      t.boolean :replace, default: false
    end
  end
end
