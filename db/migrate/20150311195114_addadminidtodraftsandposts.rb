class Addadminidtodraftsandposts < ActiveRecord::Migration
  def change
    add_column :drafts, :admin_id, :integer
    add_column :posts, :admin_id, :integer
  end
end
