class Addcolumnstoadmins < ActiveRecord::Migration
  def change
    add_column :admins, :username, :text
    add_column :admins, :password_digest, :text
  end
end
