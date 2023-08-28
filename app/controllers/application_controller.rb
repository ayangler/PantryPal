#https://www.bogotobogo.com/RubyOnRails/RubyOnRails_Devise_Adding_User_Field_and_Customization_Update_Saved.php
class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :username, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :email, :password, :current_password) }
  end

  def after_sign_in_path_for(resource)
    if inventory_exists?
      food_inventory_path(current_user.food_inventory)
    else
      new_food_inventory_path
    end
  end

  # def redirect_to_user_inventory
  #   redirect_to controller: :food_inventories_controller, action: :actionname'
  # end
end
