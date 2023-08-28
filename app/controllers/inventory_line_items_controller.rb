class InventoryLineItemsController < ApplicationController
  include Inventory
  @inventory_line_item
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]
  before_action :set_inventory_line_item, only: %i[ show edit update destroy ]

  # GET /inventory_line_items or /inventory_line_items.json
  def index
    @inventory_line_items = InventoryLineItem.all
  end

  # GET /inventory_line_items/1 or /inventory_line_items/1.json
  def show
    puts "SHOW"
    @photos = @inventory_line_item.photos
  end

  # GET /inventory_line_items/new
  def new
    @inventory_line_item = InventoryLineItem.new
  end

  # GET /inventory_line_items/1/edit
  def edit
  end

  # Page 124
  # POST /inventory_line_items or /inventory_line_items.json
  def create
    # food = Food.find(params[:inventory_line_item][:food_id])
    food = Food.find(params[:inventory_line_item][:food_id])
    @inventory = FoodInventory.find(current_user.food_inventory.id)

    @inventory_line_item = @inventory.inventory_line_items.build(inventory_line_item_params)

    respond_to do |format|
      if @inventory_line_item.save
        format.html { redirect_to food_inventory_url(current_user.food_inventory), notice: "Added to inventory!" }
        format.json { render :show, status: :created, location: @inventory_line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_line_items/1 or /inventory_line_items/1.json
  def update
    respond_to do |format|
      if @inventory_line_item.update(inventory_line_item_params)
        format.html { redirect_to food_inventory_url(current_user.food_inventory), notice: "Inventory line item was successfully updated." }
        format.json { render :show, status: :ok, location: @food_inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_line_items/1 or /inventory_line_items/1.json
  def destroy
    puts "DESTROY"
    puts params
    @inventory_line_item.destroy

    respond_to do |format|
      format.html { redirect_to food_inventory_url(current_user.food_inventory), notice: "Inventory line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    puts "Destroy_multiple in inventory_line_items_controller"

    to_delete = params["selected"].map(&:to_i)

    InventoryLineItem.where(id: to_delete).destroy_all

    # params["selected"].each do |item|
    #   if item != ""
    #     InventoryLineItem.find(item.to_i).destroy
    #   end
    # end
    respond_to do |format|
      format.html { redirect_to food_inventory_url(current_user.food_inventory), notice: "Inventory line items were successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def convert
    gli = GroceryLineItem.find(params[:id])

    new_ili = InventoryLineItem.new()

    new_ili.name = gli.name
    new_ili.quantity = gli.quantity
    new_ili.food_id = gli.food.id
    new_ili.food_inventory_id = current_user.food_inventory.id

    respond_to do |format|
      if new_ili.save
        gli.destroy
        format.html { redirect_to food_inventory_url(current_user.food_inventory), notice: "Added to inventory!" }
        format.json { render :show, status: :created, location: @inventory_line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory_line_item
    @inventory_line_item = InventoryLineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_line_item_params
    params.fetch(:inventory_line_item, {})
    params.require(:inventory_line_item).permit(:name, :quantity, :expiry_date, :unit_of_measurement, :_destroy, :food_id, photos: [])
    # params.require(:message).permit(images: [])
  end
end
