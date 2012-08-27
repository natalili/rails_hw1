class Order < ActiveRecord::Base
  attr_accessible :customer_id, :item_id, :order_date
end
