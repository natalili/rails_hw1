class AddIndexsFromOrder < ActiveRecord::Migration
  def change
    add_index :orders, :customer_id
    add_index :orders, :order_date
  end
end
