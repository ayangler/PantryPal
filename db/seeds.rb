# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.delete_all

Food.create(name: "Chocolate",
            type: "Sweets")

Food.create(name: "Butter",
            type: "Dairy")

Food.create(name: "Butter Milk",
            type: "Dairy")

Food.create(name: "Lettuce",
            type: "Vegetable")
Food.create(name: "Broccoli",
            type: "Vegetable")
Food.create(name: "Carrot",
            type: "Vegetable")
Food.create(name: "Eggplant",
            type: "Vegetable")
Food.create(name: "Beet",
            type: "Vegetable")
Food.create(name: "Spring Onion",
            type: "Vegetable")
Food.create(name: "Mushroom",
            type: "Vegetable")
Food.create(name: "Yellow Onion",
            type: "Vegetable")
Food.create(name: "Red Onion",
            type: "Vegetable")
Food.create(name: "Radish",
            type: "Vegetable")
Food.create(name: "Red Cabbage",
            type: "Vegetable")
Food.create(name: "Red Pepper",
            type: "Vegetable")
Food.create(name: "Corn",
            type: "Vegetable")
Food.create(name: "Red Chili",
            type: "Vegetable")
Food.create(name: "Celery",
            type: "Vegetable")
Food.create(name: "Cauliflower",
            type: "Vegetable")
Food.create(name: "Sweet Potato",
            type: "Vegetable")
Food.create(name: "Fennel",
            type: "Vegetable")
Food.create(name: "Pumpkin",
            type: "Vegetable")
Food.create(name: "Olive",
            type: "Vegetable")
Food.create(name: "Asparagus",
            type: "Vegetable")
Food.create(name: "Turnip",
            type: "Vegetable")
Food.create(name: "Green Bean",
            type: "Vegetable")
Food.create(name: "Green Pepper",
            type: "Vegetable")
Food.create(name: "Zucchini",
            type: "Vegetable")
Food.create(name: "Avocado",
            type: "Vegetable")

user = User.new(
  :name => "Default User",
  :email => "user@xxx.xx",
  :username => "user1",
  :password => "password",
  :password_confirmation => "password",
)
user.skip_confirmation!
user.save!
