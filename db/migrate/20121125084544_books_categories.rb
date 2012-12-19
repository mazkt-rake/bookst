class CategoriesBooks < ActiveRecord::Migration
  def change
  	create_table :categories_books, :id => false do |t|
  		t.integer :category_id
  		t.integer :book_id
  end
  add_index :categories_books, [:category_id, :book_id]
end
end
