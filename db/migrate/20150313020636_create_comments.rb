class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :name
      t.text :message
      t.integer :post_id
      t.integer :likes

      t.timestamps null: false
    end
  end
end
