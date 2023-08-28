# Preview all emails at http://localhost:3000/rails/mailers/food_inventory_mailer
class FoodInventoryMailerPreview < ActionMailer::Preview
  def new_food_inventory_email
    # Set up a temporary order for the preview
    order = FoodInventory.new(name: "Joe Smith")

    FoodInventoryMailer.with(food_inventory: order).new_food_inventory_email
  end
end
