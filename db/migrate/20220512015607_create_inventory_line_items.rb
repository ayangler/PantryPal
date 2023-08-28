class CreateInventoryLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_line_items do |t|
      t.references :food_inventory, foreign_key: true
      t.references :food, foreign_key: true
      t.datetime :expiry_date
      t.integer :quantity
      t.string :unit_of_measurement
      t.string :string

      t.timestamps
    end
  end
end
