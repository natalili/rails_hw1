class Customer < ActiveRecord::Base
  attr_accessible :name
  
  has_many :orders
  has_many :items, :through => :orders
  
  validates :name, :presence => true 
  
  scope :loyalty_program, lambda { 
    select('COUNT("customers"."id") as "count_customers_id", "customers".*').
    joins(:orders => :items).
    where("orders.order_date > ?", 90.days.ago).
    group("customers.id").
    having("count_customers_id > ?", 1)
  }
  
end