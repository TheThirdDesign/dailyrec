class Addtoposts < ActiveRecord::Migration
  def change
    add_column :posts, :favorites, :boolean
    add_column :posts, :stories, :boolean
    add_column :posts, :home, :boolean
  end
end
