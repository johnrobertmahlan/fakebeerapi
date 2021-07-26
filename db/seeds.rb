# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   Brewery.create!(name: Faker::Beer.brand, state: Faker::Address.state_abbr)
# end


Brewery.all.each do |brewery|
  3.times do
    Beer.create!(name: Faker::Beer.name, style: Faker::Beer.style, abv:rand(1.0..15.0), brewery: brewery)
  end
end