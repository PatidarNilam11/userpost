# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.where(name: "Job").first_or_create
Category.where(name: "News").first_or_create
Category.where(name: "Report").first_or_create
Category.where(name: "Event").first_or_create
