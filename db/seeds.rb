# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


actor = Actor.create(name: "Ahmed Fahmy")
director = Director.create(name: "Dollar Film")
movie = Movie.create(name: "Kalby Daleely", rating: 'PG', release_date: 1.month.ago, director: director, featured: true)
