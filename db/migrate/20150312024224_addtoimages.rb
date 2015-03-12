class Addtoimages < ActiveRecord::Migration
  def change
    add_column :images, :draft_id, :integer
    add_column :images, :post_id, :integer
    add_attachment :images, :image
  end
end
