class Product < ActiveRecord::Base
validates :title, :uniqueness => {:message =>  " already exsits"} , presence: true
validates :description , presence: true
validates :image_url , presence: true , format: {with: /\.(png|jpg)\Z/i}
validates :price, :numericality => { :greater_than => 0.01  } 
end
