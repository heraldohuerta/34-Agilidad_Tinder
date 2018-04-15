# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
20.times do |i|
User.create!(email:Faker::Internet.email,
            password:"123456789",
            remote_url_url:'http://lorempixel.com/g/400/200/',
            bio: Faker::Lorem.sentences(1, true)
)

end
