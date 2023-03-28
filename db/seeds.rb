# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'deleting data'

Transaction.delete_all

puts 'Creating 1500 fake transactions...'
1500.times do
  transaction = Transaction.new(
    price_cents:    Faker::Number.within(range: 100..2000),
    created_at: Faker::Date.between(from: '2023-01-23', to: Date.today),
    user: User.first
  )
  transaction.save!
end
puts 'Finished!'
