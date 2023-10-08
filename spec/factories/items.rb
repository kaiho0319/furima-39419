FactoryBot.define do
  factory :item do
    product_name { '商品名' }
    product_description { '商品説明' }
    item_condition_id { 2 }
    shipping_responsibility_id { 2 }
    processing_time_id { 2 }
    category_information_id { 2 }
    shipping_origin_id { 2 }
    price { '300' }
    user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end