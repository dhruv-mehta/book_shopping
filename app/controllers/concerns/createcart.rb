module CreateCart

extend ActiveSupport::Concern



	def current_cart
      Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart # this will get returned
      end
    end


	
