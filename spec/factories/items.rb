# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    user { nil }
    category { nil }
    name { 'MyString' }
    description { 'MyString' }
    status { 1 }
    starting_price { '9.99' }
    price_sold { '9.99' }
    rating { 1 }
    quantity { 1 }
    bid_start_time { '2023-11-21 15:15:28' }
    bid_end_time { '2023-11-21 15:15:28' }
    delivery_options { 'MyString' }
    pickup_delivery_address_id { 'MyString' }
  end
end
