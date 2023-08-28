class UnauthorisedInventoryError < StandardError
  def message
    "Sorry, that's not your inventory!"
  end
end
