class AddAttachmentPicturesToDrafts < ActiveRecord::Migration
  def self.up
    change_table :drafts do |t|
      t.attachment :pictures
    end
  end

  def self.down
    remove_attachment :drafts, :pictures
  end
end
