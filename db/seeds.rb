# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "monitor", price: 300, image_url: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6362/6362423_sd.jpg;maxHeight=640;maxWidth=550", description: "This is an LG 24 inch LED monitor")

product.save
