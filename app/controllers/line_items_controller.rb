class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.all
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
   @book = Book.find(params[:book_id])
    if LineItem.exists?(:cart_id => current_cart.id, :book_id => @book.id)
      item = LineItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND book_id = #{@book.id}" ])
      LineItem.update(item.id, :quantity => item.quantity + 1)
    else  
     @line_item = LineItem.create!(:cart => current_cart, :book => @book, :quantity => 1, :unit_price => @book.price)
     flash[:notice] = "Added #{@book.name} to cart."
    end
    redirect_to @current_cart
  end

  def update
    @line_item = LineItem.find(params[:id])
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
  end
end
