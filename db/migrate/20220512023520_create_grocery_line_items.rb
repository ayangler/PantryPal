class CreateGroceryLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :grocery_line_items do |t|
      t.string :name
      t.integer :quantity
      t.references :food, foreign_key: true
      t.references :grocery_list, foreign_key: true

      t.timestamps
    end
  end
end
