class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  
  has_and_belongs_to_many :orders, :join_table => :orders_items, :readonly => true
  
  validates :name, :presence => true 
  validates :price, :presence => true, 
                    :format => { :with => /^\d{0,}\.\d{2}$/}
  
  scope :popular, lambda { joins(:orders).group("items.id") } 
  scope :loyalty_program_items, lambda { joins(:orders).where("orders.id in (?)",  Order.loyalty_program_orders.to_a) }

end
