FactoryBot.define do
  factory :order do
    card_information { 4242424242424242 }
    month { 3 }
    day { 23 }
    security_code { 123 }
    # token { 'test1234' }
  end
end