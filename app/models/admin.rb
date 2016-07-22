class Admin < ActiveRecord::Base
  	has_secure_password
  	validates :name, :presence =>true, :uniqueness=>true
  	validates :password, :length => { :minimum => 5, :maximum => 40 }, :confirmation =>true
 	def is_admin?
 		is_admin == true
 	end 
end
