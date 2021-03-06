class Order < ActiveRecord::Base
attr_accessible :customer_id, :item_id, :order_date
  
  has_and_belongs_to_many :items, :join_table => :orders_items 
  belongs_to :customer
  
  validates :customer_id, :presence => true 
  validates :order_date, :presence => true 
  validates :items, :presence => true

end