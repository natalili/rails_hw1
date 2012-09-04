class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  
  has_and_belongs_to_many :orders, :join_table => :orders_items, :readonly => true
  
  validates :name, :presence => true 
  validates :price, :presence => true, 
                    :format => { :with => /^\d{0,}\.\d{2}$/}
  
  scope :popular, lambda { |count|
    select('COUNT("items"."id") AS "count_items_id", "items".*').
    joins(:orders).group("items.id").
    order("count_items_id DESC").
    having("count_items_id > ?", count)
  } 

end
