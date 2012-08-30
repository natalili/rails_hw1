class Customer < ActiveRecord::Base
  attr_accessible :name
  
  has_many :orders
  has_many :items, :through => :orders
  
  validates :name, :presence => true 
  
  scope :loyalty_program, lambda { joins(:items).where("items.id in (?)", Item.loyalty_program_items) }
end