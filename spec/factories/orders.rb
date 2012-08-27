# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    customer_id 1
    item_id 1
    order_date "2012-08-27 16:22:51"
  end
end
