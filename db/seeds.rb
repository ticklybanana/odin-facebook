# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
number_of_users = 20
number_of_users.times do |n|
  User.create(name: "Example_user_#{n}", email: "ExampleEmail#{n}@blabla.com",
              password: 'password')
end

User.create(name: "Ticklybanana", email: "onlyforuni16@gmail.com", password: "blablabla")

# Create friends
user = User.first
(number_of_users / 2).times do |n|
  user.active_friends << User.find(n + 1)
  user.requests_sent.last.update(accepted: true)
end

# Create posts
number_of_users.times do |n|
  5.times do |i|
    Post.create(author_id: n + 1, content: "I am user #{n}. I have #{i} post(s)")
  end
end

# Create comments
number_of_users.times do |n|
  User.find(n + 1).comments.build(post: Post.find(n + 2), content: "OMG THIS IS AWESOME").save
end

# Create likes
number_of_users.times do |n|
  10.times do |i|
    Like.create(user: User.find(n + 1), contentable: User.find(i + 1).posts.last)
  end
end
