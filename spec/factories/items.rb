FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/app/assets/images/flag.png")) }
    product_name { Faker::Game.title }
    text { Faker::Games::Fallout.quote }
    price {Faker::Number.between(from: 300, to: 9999999)}
    category_id {Faker::Number.between(from: 1, to: 10)}
    condition_id {Faker::Number.between(from: 1, to: 6)}
    shipping_method_id {Faker::Number.between(from: 1, to: 2)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    days_before_shipping_id {Faker::Number.between(from: 1, to: 3)}
    association :user
  end
end
