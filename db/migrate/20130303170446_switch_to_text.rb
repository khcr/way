class SwitchToText < ActiveRecord::Migration
  def change
  	remove_column :events, :info
  	remove_column :news, :content
  	remove_column :pages, :content
  	remove_column :projects, :content

  	add_column :events, :info, :text
  	add_column :news, :content, :text
  	add_column :pages, :content, :text
  	add_column :projects, :content, :text
  end
end
