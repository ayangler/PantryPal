class CreateFoodInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :food_inventories do |t|
      t.string :name

      t.timestamps
    end
  end
end
