# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying existing data"

Transaction.destroy_all

puts "creating a new transaction"
5.times do
Transaction.create!(
  user: User.first,
  timestamp: Time.now,
  price_cents: 100,
  customer_name: "John Doe",
  customer_email: "Johndoe@gmail.com",
  status: 'success'
)
end
