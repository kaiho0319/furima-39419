FactoryBot.define do
  factory :user do
    # nickname              {Faker::Name.initials(number: 2)}
    # email                 {Faker::Internet.free_email}
    # password              {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    nickname { 'testuser' }
    email { 'test@example.com' }
    password { 'aaa1234' }
    password_confirmation { 'aaa1234' }
    name { '海保' }
    last_name { '徹' }
    name_in_katakana { 'カイホ' }
    last_name_in_katakana { 'トオル' }
    date_of_birth { '2000-01-01' }
  end
end

