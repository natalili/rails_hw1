# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 
  factory :item do
    sequence(:name) {|n| "Example item#{n}"}
    description "Example desctription"
    price 1.11
  end
 
end
