# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

j1 = Joke.create(title: "Giraffe Walks into a Bar", content: "A man walks into a bar with a giraffe.  He and the giraffe proceed to get very drunk.  The giraffe then passes out and falls on the floor.  The man gets up to leave the bar when the bartender shouts, 'Hey!  You can't leave that lyin' there!' to which the man replies, 'No, it's not a lion.  It's a giraffe.'")

j2 = Joke.create(title: "Lobsters", content: "Why don't lobsters like to share?  Because they're shellfish.")

j3 = Joke.create(title: "Typical American", content: "I'm as American as they come.  Well...all except for the fact that I supporth the social welfare system, I don't beleive in God, and I could, if need be, locate Europe on a map.  So, basically, if you change my accent, and replace this perfect smile with a mouthful of crooked teeth, you got yourself a European, really.")

t1 = Tag.create(title: "bars")

t2 = Tag.create(title: "animals")

t3 = Tag.create(title: "drunkeness")

t4 = Tag.create(title: "alcohol")

t5 = Tag.create(title: "corny")

t6 = Tag.create(title: "lobster")

t7 = Tag.create(title: "giraffe")

t8 = Tag.create(title: "Americans")