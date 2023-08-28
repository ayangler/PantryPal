class Food < ApplicationRecord
  has_many :inventory_line_items, dependent: :destroy
  has_many :grocery_line_items, dependent: :destroy
  has_many :grocery_lists, :through => :grocery_line_items
  has_many :food_inventories, :through => :inventory_line_items

  def self.all_foods_asc
    return Food.all.order("name asc")
  end

  def self.all_food_types
    Food.subclasses.map(&:name)
  end
end

class Sweets < Food
  def prep
    "Smashed"
  end
end

class Dairy < Food
  def prep
    "Whipped"
  end
end

class Vegetable < Food
  def prep
    "Chopped"
  end
end
