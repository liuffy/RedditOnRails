# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Sub.create(sub_name: "/Crappy Design", description: "comic sans for days", moderator_id: 2)
Sub.create(sub_name: "/Mildly Interesting", description: "In case you've got nothing else to look at", moderator_id: 4)
Sub.create(sub_name: "/Mildly Infuriating", description: "Come here if you're looking for a bad time", moderator_id: 1)

Post.create(title: "What is the letter J in this quilt?", author_id: 1, content: "Can't tell what the pic is supposed to represent", sub_ids:[2,3])
Post.create(title: "Bad bathroom design", author_id: 3, content: "Who designed this?", sub_ids:[1])
