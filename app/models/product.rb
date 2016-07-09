class Product < ActiveRecord::Base

def method_name
	
end
validates_presence_of :title,  :message => "can't be blank"
validates_presence_of :description,  :message => "can't be blank"
validates_presence_of :image_url,  :message => "can't be blank"
validates_presence_of :price, :message => "can't be blank"
validates_uniqueness_of :title , :message => "must be unique"
validates_numericality_of :price, :greater_than => 0.01,  :message => "must be grater then 0.01"
validates :image_url, format: {with: /\.(png|jpg)\Z/i}
end
