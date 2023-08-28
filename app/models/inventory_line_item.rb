class InventoryLineItem < ApplicationRecord
  enum unit_of_measurement: {
    jar: "Jar",
    piece: "Piece",
    serving: "Serving",
    can: "Can",
  }

  belongs_to :food_inventory
  belongs_to :food
  has_many_attached :photos

  accepts_nested_attributes_for :food

  def self.get_unit_of_measurements
    return unit_of_measurements.to_a
  end

  scope :search_by_inventory, ->(food_inventory) { where(food_inventory_id: food_inventory.id) }
  scope :search_by_food, ->(food) { where(food_id: food.id) }
end
