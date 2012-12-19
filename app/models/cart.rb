class Cart < ActiveRecord::Base
	attr_accessible :purchased_at , :status

	has_many :line_items

	def total_price
		line_items.to_a.sum(&:full_price)
	end
end
