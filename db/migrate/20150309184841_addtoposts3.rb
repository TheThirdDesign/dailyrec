class Addtoposts3 < ActiveRecord::Migration
  def change
    add_column :posts, :layout, :integer
  end
end
