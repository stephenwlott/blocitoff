# This file should contain all the record creation needed to seed the database with its default values.
# If the desire is to clear the database of existing data first, enter rake db:reset
# The seed data can then be loaded with rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
# Note: by calling `User.new` instead of `create`,
# we create an instance of User which isn't immediately saved to the database.
# 
# The `skip_confirmation!` method sets the `confirmed_at` attribute
# to avoid triggering an confirmation email when the User is saved.
#
# The `save` method then saves this User to the database.

require 'faker'
 
# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Items
15.times do
  item = Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
  # set the created_at to a time within the past year
  item.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
end
items = Item.all

puts "Seeding finished"
puts "users count = #{User.count}"
puts "items count = #{Item.count}"