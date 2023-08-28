class UnauthorisedGroceryError < StandardError
  def message
    "Sorry, that's not your grocery list!"
  end
end
