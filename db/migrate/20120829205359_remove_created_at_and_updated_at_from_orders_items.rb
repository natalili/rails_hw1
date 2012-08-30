class RemoveCreatedAtAndUpdatedAtFromOrdersItems < ActiveRecord::Migration
  def up
    remove_column :orders_items, :created_at
    remove_column :orders_items, :updated_at
  end

  def down
    add_column :orders_items, :updated_at, :datetime
    add_column :orders_items, :created_at, :datetime
  end
end
