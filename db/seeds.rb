# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..50).each_with_index do |single, index|
  Employee.create(first_name: "eFname#{index + 1}", last_name: "eLname#{index + 1}", email: "eFname#{index + 1}@gmail.com", age: Random.rand(18...32), no_of_order: Random.rand(3..7), full_time_avilable: (index % 2  == 0 ? true : false), salary: index % 4)
end

# t.string "first_name"
# t.string "last_name"
# t.string "email"
# t.integer "age"
# t.integer "no_of_order"
# t.boolean "full_time_avilable"
# t.integer "salary"
