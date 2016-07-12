module CreateCart

extend ActiveSupport::Concern

private

	def current_cart
		@cart=Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
		flash[:notice] = "cart not found"
		cart=Cart.create!
		session[:cart_id] = cart.id
		return @cart
	end

	
end