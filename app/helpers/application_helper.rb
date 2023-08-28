module ApplicationHelper
  def inventory_exists?
    return current_user.food_inventory != nil
  end

  def expired(date)
    if date && date < Date.today
      return true
    end
    return false
  end

  # Change to expiry_date formatter and make a separate generic date formatter
  def date_formatter(date)
    if date
      formatted_date = date.strftime("%d/%m/%Y")
      (if expired(date) then ("!" + formatted_date) else formatted_date end)
    else
      return "NIL"
    end
  end

  # put in model

  def bootstrap_class_for(flash_type)
    puts "flash_type"
    puts flash_type
    case flash_type
    when "sucess"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
