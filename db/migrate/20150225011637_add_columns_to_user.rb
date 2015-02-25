class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :email, :text
    add_column :users, :message, :text
  end
end
