class Customer < ActiveRecord::Base
  attr_accessible :name
  
  has_many :orders
  has_many :items, :through => :orders
  
  validates :name, :presence => true 
  
  scope :loyalty_program, lambda { 
    select('COUNT("customers"."id") as "count_customers_id", "customers".*').
    joins(:items).
    where("items.id in (?)", Item.loyalty_program_items).
    group("customers.id").
    having("count_customers_id > ?", 1)
  }
end