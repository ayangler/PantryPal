class FoodInventoryMailer < ApplicationMailer
  def new_food_inventory_email(email)
    @food_inventory = params[:food_inventory]

    mail(to: email, subject: "New inventory created!")
  end
end
