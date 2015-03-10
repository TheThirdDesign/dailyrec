class Addsummarycolumn < ActiveRecord::Migration
  def change
    add_column :posts, :teaser, :text
    remove_column :posts, :favorites
    remove_column :posts,  :stories
    remove_column :posts, :home
  end
end
