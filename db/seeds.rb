puts "Seeing data"
Comment.destroy_all
Tweet.destroy_all
User.destroy_all

# Users
alessandra = User.create(email: "alessandra@gmail.com", password: "merequetengue", username: "ale_rodrigez", name: "Alessandra Rodriguez Prado")
alessandra.avatar.attach(io: File.open("db/images/alessandra.png"), filename: "alessandra")
robert = User.create(email: "robertpm@gmail.com", password: "sEcretPasswOrd", username: "RobertPM", name: "Robert Prince Miles")
olena = User.create(email: "oleole@gmail.com", password: "sparky", username: "Olena", name: "Olena Martin Durand")
fatima = User.create(email: "fatigallart@gmail.com", password: "AlIcE21", username: "AliceGallart", name: "Fati Gallart Ramiro")

# Tweets
tweet1 = Tweet.create(body: "I'm senlling my photocards of Astro, Pentagon and Victon if you are interested please reply this tweet", user: alessandra)
tweet2 = Tweet.create(body: "Hi everyone", user: olena)

# Comments
comment1 = Comment.create(body: "what is the price???", tweet: tweet1, user: robert)
comment2 = Comment.create(body: "I'm want Pentagon photocards", tweet: tweet1, user: olena)
comment3 = Comment.create(body: "more info about the photocards of Victon please", tweet: tweet1, user: fatima)
comment4 = Comment.create(body: "hii", tweet: tweet2, user: fatima)

puts "End seeding"