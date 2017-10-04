# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

number = 0

20.times do
  user = User.create(name: "Example_user_#{number}", email: "ExampleEmail#{number}@blabla.com",
                     password: 'password')
  user.posts.build(content: "I AM #{number} YEARS OLD BOI!")
  number += 1
end
