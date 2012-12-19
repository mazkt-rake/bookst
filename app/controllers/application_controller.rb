class ApplicationController < ActionController::Base
  protect_from_forgery
helper :all
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
 def current_cart
    session[:cart_id] ||= Cart.create!.id
    @current_cart ||= Cart.find(session[:cart_id])
  end
end
