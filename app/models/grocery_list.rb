class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :grocery_line_items, dependent: :destroy
  has_many :foods, :through => :grocery_line_items, dependent: :destroy
end
