class FoodInventoriesController < ApplicationController
  #include FoodInventoriesHelper

  before_action :authenticate_user!
  before_action :set_food_inventory, only: %i[ edit update destroy ]

  def show
    begin
      temp = FoodInventory.includes(inventory_line_items: :food).find_by(user_id: current_user.id)
      # Find takes in the id, returns ActiveRecord::RecordNotFound
      # find_by returns nil takes key : val
      # Where takes key:val but returns multiple, not found returns empty ActiveRecord::Relation

      if temp.id != params[:id].to_i
        raise UnauthorisedInventoryError
      else
        @food_inventory = temp
      end
    rescue UnauthorisedInventoryError => exc
      logger.error("Message for the log file #{exc.message}")
      flash[:error] = "#{exc.message}"
      redirect_to food_inventory_path(current_user.food_inventory.id)
    end

    # current_user.food_inventory does the same thing?
  end

  # GET /food_inventories/new
  def new
    begin
      if current_user.has_inventory
        raise InventoryExistsError
      else
        @food_inventory = FoodInventory.new
      end
    rescue InventoryExistsError => exc
      logger.error("Message for the log file #{exc.message}")
      flash[:alert] = "User has exisiting Inventory."
      redirect_to food_inventory_path(current_user.food_inventory.id)
    end
  end

  # GET /food_inventories/1/edit
  def edit
    # Refer to before_action
    # https://stackoverflow.com/questions/21040298/empty-but-working-show-method-on-controller-generated-via-scaffolding
  end

  # POST /food_inventories or /food_inventories.json
  def create
    @food_inventory = FoodInventory.new(food_inventory_params)

    respond_to do |format|
      if @food_inventory.save
        # FoodInventoryMailer.with(food_inventory: @food_inventory).new_food_inventory_email(current_user.email).deliver_later
        format.html { redirect_to food_inventory_url(@food_inventory), notice: "Food inventory was successfully created." }
        format.json { render :show, status: :created, location: @food_inventory }
        puts current_user.food_inventory.id
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_inventories/1 or /food_inventories/1.json
  def update
    respond_to do |format|
      if @food_inventory.update(food_inventory_params)
        format.html { redirect_to food_inventory_url(@food_inventory), notice: "Food inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @food_inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_inventories/1 or /food_inventories/1.json
  def destroy
    InventoryLineItem.where(food_inventory_id: @food_inventory.id).delete_all

    respond_to do |format|
      format.html { redirect_to food_inventory_url(@food_inventory), notice: "Food inventory was cleared." }
      format.json { head :no_content }
    end
  end

  def delete_multiple
    @food_inventory = FoodInventory.find(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food_inventory
    @food_inventory = FoodInventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_inventory_params
    params.require(:food_inventory).permit(:name, :user_id,
                                           inventory_line_items_attributes: [:id, :name, :quantity, :expiry_date, :unit_of_measurement, :_destroy, :food_id, food_attributes: [:id, :name, :type, :_destroy]])
  end
end
