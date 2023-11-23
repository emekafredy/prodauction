FactoryBot.define do
  factory :address do
    user { nil }
    number { "MyString" }
    street { "MyString" }
    city { "MyString" }
    state { "MyString" }
    country { "MyString" }
  end
end
