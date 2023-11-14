FactoryBot.define do
  factory :provider do
    code {'anybank_simple_xf' }
    name { 'Any Bank' }
    status { :active }
    mode { :web }
  end
end