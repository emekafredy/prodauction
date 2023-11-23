FactoryBot.define do
  factory :wallet do
    user { nil }
    gateway { "MyString" }
    customer_id { "MyString" }
    balance { "9.99" }
    last_deposit { "9.99" }
  end
end
