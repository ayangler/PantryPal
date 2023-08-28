module FoodInventoriesHelper
  def create_new_inventory
    raise InventoryExists if !current_user.food_inventory.nil?
    return FoodInventory.new
  end
end
