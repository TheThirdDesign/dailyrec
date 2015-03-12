class Remove < ActiveRecord::Migration
  def change
    remove_column :drafts, :pictures_file_name, :text
    remove_column :drafts, :pictures_content_type, :text
    remove_column :drafts, :pictures_file_size, :integer
    remove_column :drafts, :pictures_updated_at, :datetime
  end
end
