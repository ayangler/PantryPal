class GroceryListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grocery_list, only: %i[ edit update destroy ]

  def new
    @grocery_list = GroceryList.new
  end

  def show
    begin
      temp = GroceryList.find_by(user_id: current_user.id)

      if temp.id != params[:id].to_i
        raise UnauthorisedGroceryError
      else
        @grocery_list = temp
      end
    rescue UnauthorisedGroceryError => exc
      logger.error("Message for the log file #{exc.message}")
      flash[:error] = "#{exc.message}"
      redirect_to grocery_list_path(current_user.grocery_list.id)
    end
  end

  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    respond_to do |format|
      if @grocery_list.save
        format.html { redirect_to grocery_list_url(@grocery_list), notice: "Grocery List was successfully created." }
        format.json { render :show, status: :created, location: @grocery_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @grocery_list.update(grocery_list_params)
        format.html { redirect_to grocery_list_url(@grocery_list), notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grocery_list
    @grocery_list = GroceryList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grocery_list_params
    params.require(:grocery_list).permit(:name, :user_id)
  end
end
