# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed User to own items to be seeded
# User.create(
#   firstname: 'John',
#   lastname: 'Doe',
#   email: 'john@doe.com',
#   username: 'johny_doe',
#   password: ENV.fetch('USER_PASSWORD', nil),
#   phone: '1234679321'
# )

# # Create categories for items to be seeded
# %w[Furniture Electronics Fashion Art Tools Utensils Sports].map do |c|
#   Category.create!(name: c)
# end

def get_category(name)
  Category.find_by(name:)
end

# Method to create Items
def create_items_for_category(category)
  2.times do |_i|
    Item.new(
      user: User.find_by(email: 'john@doe.com'),
      category: get_category(category),
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      status: 2,
      starting_price: Faker::Commerce.price,
      bid_start_time: Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 3),
      bid_end_time: Faker::Time.between_dates(from: Date.today + 4, to: Date.today + 5),
      state: %w[Lagos Imo Kaduna Akwa-Ibom Kogi Enugu Plateau].sample,
      country: 'Nigeria'
    ).save(validate: false)
  end
end

# Create a pair of items for each seeded category
%w[Furniture Electronics Fashion Art Tools Utensils Sports].map do |c|
  create_items_for_category(c)
end

# Attache Images to each Seeded Item
Item.all.each do |item|
  puts "Attaching pictures for #{item.name}..."
  item.pictures.attach(
    io: File.open(Rails.root.join('public', 'images', "#{item.category.name}1.jpg")),
    filename: "#{item.category.name}1.jpg",
    content_type: 'image/jpg'
  )
  item.pictures.attach(
    io: File.open(Rails.root.join('public', 'images', "#{item.category.name}2.jpg")),
    filename: "#{item.category.name}2.jpg",
    content_type: 'image/jpg'
  )
  puts 'Done'
end
