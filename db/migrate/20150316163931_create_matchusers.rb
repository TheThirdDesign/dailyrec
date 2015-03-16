class CreateMatchusers < ActiveRecord::Migration
  def change
    create_table :matchusers do |t|
      t.text :name
      t.text :email
      t.text :specialty
      t.text :phone

      t.timestamps null: false
    end
  end
end
