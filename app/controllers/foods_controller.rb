class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: %i[ show edit update destroy ], except: []

  # GET /foods or /foods.json
  def index
    @foods = Food.includes(inventory_line_items: :food_inventory)
    @food_find_by_name = Food.find_by(name: "Red Pepper")
    @plucked_types = Food.distinct().pluck(:type) # SELECT DISTINCT type FROM food
    @plucked_names = Food.where(type: "Vegetable").pluck(:name)
    @plucked_name_type = Food.pluck(:name, :type).to_h
  end

  # GET /foods/1 or /foods/1.json
  # resources :foods
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  def random_food
    @dictionary = { "Sweets" => "Eat in moderation!",
                    "Vegetable" => "The edible part of a plant. ", "Dairy" => "Containing or made from milk." }
    @food = Food.all.sample
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    #respond_to is a rails specific method that defines how requests for different formats (like xml and html)
    #are responded to. The do and |format| delineate a ruby block, with do acting like a open brace and end as a
    #closing brace, and |format| defines the block variable that gets its value from the yield statement within responds_to.

    respond_to do |format|
      if @food.save
        # Saves the model.
        # If the model is new a record gets created in the database, otherwise the existing record gets updated.
        format.html { redirect_to food_url(@food), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def demo_includes
    puts "With includes"
    @foods.map { |food| food.inventory_line_items }.flatten
    puts "Without includes"
    Food.all.map { |food| food.inventory_line_items }.flatten
  end

  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:type, :name)
  end
end
