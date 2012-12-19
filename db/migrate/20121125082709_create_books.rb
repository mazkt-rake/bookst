class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :info
      t.string :isbn
      t.string :authorname
      t.string :price
      t.string :publisher
      t.date :publisherdate
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
