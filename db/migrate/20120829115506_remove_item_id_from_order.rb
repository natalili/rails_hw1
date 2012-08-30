class RemoveItemIdFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :item_id
  end

  def down
    add_column :orders, :item_id, :integer
  end
end
