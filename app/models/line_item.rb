class LineItem < ActiveRecord::Base
	attr_accessible :book_id , :cart_id, :unit_price , :quantity, :cart , :book
	belongs_to :cart
	belongs_to :book

	def full_price
		unit_price * quantity
	end
end
