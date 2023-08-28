module Inventory
  private

  def set_inventory
    @inventory = current_user.inventory
  end
end
