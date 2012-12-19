class BooksStocks < ActiveRecord::Migration
  def change
  	create_table :books_stocks, :id => false do |t|
  		t.integer :book_id
  		t.integer :stock_id
  end
  add_index :books_stocks, [:book_id,:stock_id]
end
 
end
