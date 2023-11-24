# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
  firstname: 'John',
  lastname: 'Doe',
  email: 'john@doe.com',
  username: 'johny_doe',
  password: ENV.fetch('USER_PASSWORD', nil),
  phone: '1234679321'
)

%w[Furnitue Electronics Fashion Art Tools Utensils Sports].map do |c|
  Category.create!(name: c)
end

def get_category(name)
  Category.find_by(name:)
end

def create_items_for_category(category)
  4.times do |_i|
    Item.create!(
      user: User.find_by(email: 'john@doe.com'),
      category: get_category(category),
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      # image: Faker::LoremFlickr.image,
      # pictures: [
      #   Faker::LoremFlickr.image,
      #   Faker::LoremFlickr.image,
      #   Faker::LoremFlickr.image
      # ],
      status: 2,
      starting_price: Faker::Commerce.price,
      bid_start_time: Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 3),
      bid_end_time: Faker::Time.between_dates(from: Date.today + 4, to: Date.today + 5),
      state: %w[Lagos Imo Kaduna Akwa-Ibom Kogi Enugu Plateau].sample,
      country: 'Nigeria'
    )
  end
end

%w[Furnitue Electronics Fashion Art Tools Utensils Sports].map do |c|
  create_items_for_category(c)
end
