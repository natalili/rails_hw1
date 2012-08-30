class CreateJoinOrdersItems < ActiveRecord::Migration
  def up
    create_table :orders_items do |t|
      t.integer :order_id
      t.integer :item_id
    
      t.timestamps
    end
    add_index :orders_items, :order_id
    add_index :orders_items, :item_id
  end

  def down
    drop_table :orders_items
  end
end
