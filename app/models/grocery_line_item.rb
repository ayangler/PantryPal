class GroceryLineItem < ApplicationRecord
  belongs_to :food
  belongs_to :grocery_list
end
