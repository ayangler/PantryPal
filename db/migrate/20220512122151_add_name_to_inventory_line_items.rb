class AddNameToInventoryLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :inventory_line_items, :name, :string
  end
end
