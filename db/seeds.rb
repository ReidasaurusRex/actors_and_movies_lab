# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create(title: "Top Hat", year: 1935)
Movie.create(title: "V for Vendetta", year: 2005)
Movie.create(title: "Garden State", year: 2004 )

Actor.create(name: "Fred Astaire")
Actor.create(name: "Hugo Weaving",)
Actor.create(name: "Natalie Portman",)
Actor.create(name: "Zach Braff",)