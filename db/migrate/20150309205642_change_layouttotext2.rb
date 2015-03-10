class ChangeLayouttotext2 < ActiveRecord::Migration
  def change
    change_column :posts, :layout, :text
  end
end
