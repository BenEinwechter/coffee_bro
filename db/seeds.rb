require 'faker'

Faker::Config.random = Random.new(42)

coffees = 8.times.map do
  Ingredient.create!(
    name: Faker::Coffee.variety + ' Coffee'
  )
end

water = Ingredient.create(name: 'Water')
milk = Ingredient.create!(name: 'Milk')
half_and_half = Ingredient.create!(name: 'Half and Half')
oat_milk = Ingredient.create!(name: 'Oat Milk')
soy_milk = Ingredient.create!(name: 'Soy Milk')

drinks = [
  Drink.create!(
    name: 'Double Espresso',
    price: 3.50,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[0], grams: 18),
      DrinkIngredient.new(ingredient: water, grams: 36)
    ]
  ),
  Drink.create!(
    name: 'Single Espresso',
    price: 3.00,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[0], grams: 9),
      DrinkIngredient.new(ingredient: water, grams: 18)
    ]
  ),
  Drink.create!(
    name: 'Lungo',
    price: 3.55,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[2], grams: 19),
      DrinkIngredient.new(ingredient: water, grams: 57)
    ]
  ),
  Drink.create!(
    name: 'Americano',
    price: 3.75,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[3], grams: 20),
      DrinkIngredient.new(ingredient: water, grams: 120)
    ]
  ),
  Drink.create!(
    name: 'Macchiato',
    price: 3.75,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[4], grams: 20),
      DrinkIngredient.new(ingredient: water, grams: 30),
      DrinkIngredient.new(ingredient: milk, grams: 28)
    ]
  ),
  Drink.create!(
    name: 'Cappuccino',
    price: 5.00,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[5], grams: 18),
      DrinkIngredient.new(ingredient: water, grams: 30),
      DrinkIngredient.new(ingredient: milk, grams: 112)
    ]
  ),
  Drink.create!(
    name: 'Latte',
    price: 5.75,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[5], grams: 20),
      DrinkIngredient.new(ingredient: water, grams: 30),
      DrinkIngredient.new(ingredient: milk, grams: 240)
    ]
  ),
  Drink.create!(
    name: 'Latte with Oatmeal Milk',
    price: 6.00,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[6], grams: 20),
      DrinkIngredient.new(ingredient: water, grams: 30),
      DrinkIngredient.new(ingredient: oat_milk, grams: 235)
    ]
  ),
  Drink.create!(
    name: 'Latte with Soy Milk',
    price: 5.50,
    drink_ingredients: [
      DrinkIngredient.new(ingredient: coffees[6], grams: 20),
      DrinkIngredient.new(ingredient: water, grams: 30),
      DrinkIngredient.new(ingredient: soy_milk, grams: 250)
    ]
  )
]

customers = 100.times.map do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  Customer.create!(
    first_name: first_name,
    last_name: last_name,
    email: Faker::Internet.unique.email(name: "#{first_name} #{last_name}")
  )
end

customers.sample(85).each do |customer|
  customer.update(favorite_drink: drinks.sample)
end

500.times do
  drink = drinks.sample
  tax = (drink.price * 0.0475).round(2)
  Sale.create!(
    customer: customers.sample,
    drink: drink,
    price: drink.price,
    tax: tax,
    total: drink.price + tax
  )
end
