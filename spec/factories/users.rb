FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name { '海保' }
    last_name { '徹' }
    name_in_katakana { 'カイホ' }
    last_name_in_katakana { 'トオル' }
    date_of_birth { '2000-01-01' }
  end
end

