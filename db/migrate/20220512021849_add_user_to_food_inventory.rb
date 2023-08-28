class AddUserToFoodInventory < ActiveRecord::Migration[5.2]
  def change
    add_reference :food_inventories, :user, foreign_key: true
  end
end
