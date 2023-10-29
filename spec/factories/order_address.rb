FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_origin_id { 2 }
    city_ward_or_town { '横浜市緑区' }
    street_address { '青山1-1-1' }
    building_name { '街' }
    phone_number { 19012345678 }
    token {"tok_abcdefghijk00000000000000000"}


    trait :order do
     user
     item
    end
  end
end