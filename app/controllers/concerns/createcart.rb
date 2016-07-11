module CreateCart

extend ActiveSupport::concern 

private

		def current_cart
	
			

			@cart=Cart.find(session[:cart_id])
			rescue ActiveRecord::RecordNotFound
			flash[:notice] = "cart not found"
				cart=Cart.Create
				session[:cart_id] = cart.id
			end
		end
	
end