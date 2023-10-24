FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    shipping_origin_id { 5 }
    city_ward_or_town { '横浜市緑区' }
    street_address { '青山1-1-1' }
    building_name { '' }
    phone_number { 19012345678 }
  end
end