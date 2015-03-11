class Addcolumnstoadmins2 < ActiveRecord::Migration
  def change
    add_column :admins, :adminname, :text
    remove_column :admins, :username, :text
  end
end
