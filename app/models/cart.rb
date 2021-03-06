class Cart < ActiveRecord::Base

	has_many :line_items ,  dependent: :destroy
	has_many :products, :through => :line_items


	def total_price
		line_items.to_a.sum{|item| item.total_price}	
	end
	
	def total_cart_price
		total_price = 0 
		self.line_items.includes(:product).each do |line_item| 
			total_price += line_item.quantity.to_i * line_item.product.price.to_f
		end
		total_price
	end 
	# def add_quantity(product_id)
	# 	puts "hello i am here"
	# 	current_item = line_items.find_by_product_id(product_id) 
	# 	if current_item
	# 	    current_item.quantity=current_item.quantity.to_i+1
	# 	else
	# 	    current_item = line_items.build(product_id: product_id)
	# 	end
	# 	current_item
	# end

end