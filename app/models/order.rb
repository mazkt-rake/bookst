class Order < ActiveRecord::Base
	attr_accessible :total, :status , :card_holder_name, :order_number
	has_many :books
end
