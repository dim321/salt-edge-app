FactoryBot.define do
  factory :user do
    nickname { 'Alexandro' }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
