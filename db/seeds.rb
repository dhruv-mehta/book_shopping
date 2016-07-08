# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!([{
	title: "connect the dots",
	description: "this is the book writen by the indian autor rashmi bansal stroy to incourage all",
  	image_url: "1.jpg",
  	price: 200
}])