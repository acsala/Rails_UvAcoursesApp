class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :store_history
  
	#The current_cart starts by getting the :cart_id from the session object and then attempts to find a cart corresponding to this id. If such a cart 			record is not found (which will happen if the id is nil or invalid for any reason), then this method will proceed to create a new Cart, store the id 			of the created cart into the session, and then return the new cart.
	
	#Note that we place the current_cart method in the ApplicationController and mark it as private. This makes this method available only to controllers 	and fur- thermore prevents Rails from ever making it available as an action on the controller.
  private
		def current_cart
			Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
  		end
  #---------
  
  def store_history
    session[:history] ||= []
    session[:history].delete_at(0) if session[:history].size >= 5
    session[:history] << request.url
  end
  #--------------------
  
  
end
