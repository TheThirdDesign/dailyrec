class Addtoposts2 < ActiveRecord::Migration
  def change
    add_column :posts, :title, :text
    add_column :posts, :category, :text
    add_column :posts, :date, :text
    add_column :posts, :content, :text
    add_column :posts, :pictures, :text, array: true, default: []
  end
end
