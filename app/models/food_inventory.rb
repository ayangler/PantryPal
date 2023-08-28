class FoodInventory < ApplicationRecord
  has_many :inventory_line_items, dependent: :destroy, inverse_of: :food_inventory
  belongs_to :user
  has_many :foods, :through => :inventory_line_items, dependent: :destroy

  accepts_nested_attributes_for :inventory_line_items
  accepts_nested_attributes_for :foods

  def is_empty
    return self.inventory_line_items.empty?
  end

  def for_calendar_chart
    {
      data: InventoryLineItem.where(food_inventory_id: self.id).where.not(expiry_date: nil).group_by_day(:expiry_date, series: false).count.to_a,
    }
  end

  def get_num_of_expired
    return InventoryLineItem.where(food_inventory_id: self.id).where.not(expiry_date: nil).where("expiry_date < ?", Date.today).size
  end

  def get_num_of_non_expired
    return InventoryLineItem.where(food_inventory_id: self.id).where.not(expiry_date: nil).where("expiry_date >= ?", Date.today).size
  end
end
