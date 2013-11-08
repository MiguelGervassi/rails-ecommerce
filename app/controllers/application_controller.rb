class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    # get current cart
    def set_cart
      if session[:cart_id]
        @cart ||= Cart.find(session[:cart_id])
        session[:cart_id] = nil if @cart.purchased_at
      end
      if session[:cart_id].nil?
        @cart = Cart.create!
        session[:cart_id] = @cart.id
      end
      @cart
    end

end
