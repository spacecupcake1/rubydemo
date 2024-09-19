# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(name: "Product 1", quantity: 10)
Product.create(name: "Product 2", quantity: 20)
Product.create(name: "Product 3", quantity: 30)
Product.create(name: "Product 4", quantity: 40)
Product.create(name: "Product 5", quantity: 50)
