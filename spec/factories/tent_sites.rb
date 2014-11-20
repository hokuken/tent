# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tent_site, :class => 'Tent::Site' do
    title { Faker::Commerce.product_name }
    path  { Faker::Internet.domain_word }
  end
end
