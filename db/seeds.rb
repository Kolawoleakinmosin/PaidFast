# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'devise'

puts 'deleting data'

Transaction.destroy_all

puts 'deleting product'
Product.destroy_all

puts 'deleting user'
User.destroy_all

puts 'creating user'
User.create!(first_name: "Karmen", last_name: "de Reuck", email: "dereuckkarmen@gmail.com", password: "123456", business_name: "Loafy")

puts 'Creating 1500 fake transactions...'
1500.times do
  transaction = Transaction.new(
    price_cents:    Faker::Number.within(range: 100..2000),
    user: User.first,
    customer_name: Faker::Name.unique.name,
    timestamp: Faker::Time.between_dates(from: Date.today - 120, to: Date.today - 1, period: :day),
    status: "success"
  )
  transaction.save!
end
puts 'Finished!'
