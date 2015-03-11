class AddcolumnstoDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :pictures, :text, array: true, default: []
    add_column :drafts, :teaser, :text
  end
end
