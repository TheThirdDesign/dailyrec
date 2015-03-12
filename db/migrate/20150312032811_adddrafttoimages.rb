class Adddrafttoimages < ActiveRecord::Migration
  def change
    add_index :images, :draft_id
  end
end
