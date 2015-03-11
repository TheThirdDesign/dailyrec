class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.text :title
      t.text :category
      t.text :date
      t.text :content
      t.text :layout

      t.timestamps null: false
    end
  end
end
