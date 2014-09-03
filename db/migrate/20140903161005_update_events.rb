class UpdateEvents < ActiveRecord::Migration
  def change
  		change_table(:events) do |t|
  			t.remove :president
  			t.remove :remarque
  		end
  end
end
