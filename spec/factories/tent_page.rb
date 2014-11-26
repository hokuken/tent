# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tent_page, :class => 'Tent::Page' do
    site_id { create(:tent_site).id }
    path  { Faker::Internet.domain_word }

    factory :tent_page_default do
      path 'index'
    end
  end
end
