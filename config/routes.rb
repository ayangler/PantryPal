Rails.application.routes.draw do
  get "landing/index"
  resources :grocery_lists
  resources :grocery_line_items

  get "myprofile" => "yours#profile", :as => :myprofile #my_profile
  resources :foods do
    get :random, to: "foods#random_food", on: :collection
  end

  get "food_inventories/:id/delete_multiple" => "food_inventories#delete_multiple", as: "delete_multiple"

  resources :inventory_line_items do
    delete "destroy_multiple", to: "inventory_line_items#destroy_multiple", on: :collection
    post "convert/:id", to: "inventory_line_items#convert", on: :collection, as: "convert"
  end

  resources :food_inventories, :except => [:index]

  devise_for :users, :controllers => { :registrations => "my_devise/registrations" }
  root "landing#index"
  get "landing/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
