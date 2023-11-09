FactoryBot.define do
  factory :customer do
    user
    identifier { user.email }
  end
end
