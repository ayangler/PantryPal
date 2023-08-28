class GroceryLineItemsController < ApplicationController
  before_action :authenticate_user! #, only: [:new, :edit, :update, :destroy]
  before_action :set_grocery_line_item, only: %i[ show edit update destroy ]

  def index
    @grocery_line_items = GroceryLineItem.all
  end

  def show
  end

  def new
    @grocery_line_item = GroceryLineItem.new
  end

  def edit
  end

  def create
    # food = Food.find(params[:grocery_line_item][:food_id])
    food = Food.find(params[:grocery_line_item][:food_id])
    @grocery_list = GroceryList.find(current_user.grocery_list.id)

    @grocery_line_item = @grocery_list.grocery_line_items.build(grocery_line_item_params)

    respond_to do |format|
      if @grocery_line_item.save
        format.html { redirect_to grocery_list_url(current_user.grocery_list), notice: "Added to grocery list!" }
        format.json { render :show, status: :created, location: @grocery_line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grocery_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @grocery_line_item.update(grocery_line_item_params)
        format.html { redirect_to grocery_list_url(current_user.grocery_list), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    puts "DESTROY"
    puts params
    @grocery_line_item.destroy

    respond_to do |format|
      format.html { redirect_to grocery_list_url(current_user.grocery_list), notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_grocery_line_item
    @grocery_line_item = GroceryLineItem.find(params[:id])
  end

  def grocery_line_item_params
    params.fetch(:grocery_line_item, {})
    params.require(:grocery_line_item).permit(:name, :quantity, :_destroy, :food_id)
  end
end
