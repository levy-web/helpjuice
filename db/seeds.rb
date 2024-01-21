# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#create product instance 20 timens with name and description.

20.times do |i|
    Product.create(name:Faker::Commerce.product_name,
                    description: Faker::Lorem.paragraphs(number:2) );

end

Product.reindex
