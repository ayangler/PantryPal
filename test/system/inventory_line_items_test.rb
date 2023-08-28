require "application_system_test_case"

class InventoryLineItemsTest < ApplicationSystemTestCase
  setup do
    @inventory_line_item = inventory_line_items(:one)
  end

  test "visiting the index" do
    visit inventory_line_items_url
    assert_selector "h1", text: "Inventory Line Items"
  end

  test "creating a Inventory line item" do
    visit inventory_line_items_url
    click_on "New Inventory Line Item"

    click_on "Create Inventory line item"

    assert_text "Inventory line item was successfully created"
    click_on "Back"
  end

  test "updating a Inventory line item" do
    visit inventory_line_items_url
    click_on "Edit", match: :first

    click_on "Update Inventory line item"

    assert_text "Inventory line item was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventory line item" do
    visit inventory_line_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventory line item was successfully destroyed"
  end
end
