# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tent_site, :class => 'Tent::Site' do
    title { Faker::Commerce.product_name }
    path  { Faker::Internet.domain_word }

    factory :tent_site_default do
      default true
    end
  end

  factory :tent_site_invalid, :class => 'Tent::Site' do
    title ''
    path ''
  end
end
