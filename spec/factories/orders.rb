# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :order do
    association :customer
    order_date Time.zone.now
  end
end
