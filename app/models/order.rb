class Order < ActiveRecord::Base

	has_many :line_items ,  dependent: :destroy


	PAYMENT=['check' , 'credit Card' , 'Purchase Order'].freeze
	validates :name ,:email , :address ,:pay_type , :presence => true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { with: VALID_EMAIL_REGEX },  case_sensitive: false 

end
