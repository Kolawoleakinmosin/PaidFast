# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Creating 1000 fake transactions...'
1000.times do
  transaction = Transaction.new(
    price_cents:    Faker::Company.name,
    created_at: "#{Faker::Address.street_address}, #{Faker::Address.city}",
  )
  restaurant.save!
end
puts 'Finished!'
