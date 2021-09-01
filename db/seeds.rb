# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

10.times do |i|
  Todo.create(
    title: "Todo #{i + 1}",
    description: "#{i + 1} Lorem ipsum saves lives",
    is_done: rand(2) == 1,
    due_date: (rand(2) == 1) ? nil : DateTime.now()
  )
end
