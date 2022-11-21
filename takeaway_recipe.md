# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

    As a customer
    So that I can check if I want to order something
    I would like to see a list of dishes with prices.

    As a customer
    So that I can order the meal I want
    I would like to be able to select some number of several available dishes.

    As a customer
    So that I can verify that my order is correct
    I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

    As a customer
    So that I am reassured that my order will be delivered on time
    I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

Fair warning: if you push your Twilio API Key to a public Github repository, anyone will be able to see and use it. What are the security implications of that? How will you keep that information out of your repository?

## 2. Design the Class System

```ruby
class MenuItem
  def initialize(name, price)
    # name: string
    # price: integer
  end

  def name
    # returns item name
  end

  def price
    # returns item price
  end
end

class Menu
  def initialize
    # initialized with empty array
  end

  def list
    # returns menu list
  end

  def add(item)
    # adds item to menu
    # returns nothing
  end

  def display
    # returns the menu in a formated string
  end
end

class Order
  def initialize
    # initialized with empty array
  end

  def list
    # returns order list
  end

  def add(item, number)
    # item is an instance of FoodItem
    # number is an integer
    # adds a quantity of item to order list
    # returns nothing
  end

  def remove(item, number)
    # item: instance of FoodItem
    # number: integer
    # removes a quantity of item from order list
    # returns nothing
  end

  def display
    # returns the order in a formatted string
  end
end

class FinishOrder
  def initialize(order)
    # order: instance of Order
    # initialized with order.list
  end

  def list
    # returns order list
  end

  def receipt
    # returns items, quantities and total in a formatted string
  end

  def send_sms(number)
    # sends a text notification to customer
  end

  private 

  def total_cost
    # calculates and returns an integer representing total of the order 
  end

  def format(price)
    # price: integer
    # formats the price in the correct formatting
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Menu & MenuItem

# 1. lists one added menu item
cheeseburger = MenuItem.new("cheeseburger", 2.50)
menu = Menu.new
menu.add(cheeseburger)
menu.list # => [cheeseburger, hotdog]

# 2. lists multiple added menu items
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
menu = Menu.new
menu.add(cheeseburger)
menu.add(hotdog)
menu.list # => [cheeseburger, hotdog]

# 3. returns the menu in a formatted string
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
menu = Menu.new
menu.add(cheeseburger)
menu.add(hotdog)
menu.display # => "1. cheeseburger - £2.50\n2. hotdog - £1.50"

# Order & MenuItem

# 1. adds one item 
cheeseburger = MenuItem.new("cheeseburger", 2.50)
order = Order.new
order.add(cheeseburger, 1)
order.list # => [cheeseburger]

# 2. adds multiple items
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.list # => [cheeseburger, hotdog, hotdog]

# 2. removes one item
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.remove(hotdog, 1)
order.list # => [cheeseburger, hotdog]

# 3. removes multiple items
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.remove(cheeseburger, 1)
order.remove(hotdog, 1)
order.list # => [hotdog]

# 4. displays one added item in a formatted string
cheeseburger = MenuItem.new("cheeseburger", 2.50)
order = Order.new
order.add(cheeseburger, 1)
order.display # => "item: cheeseburger, quantity: 1, price: £2.50"

# 5. displays multiple added items in a formatted string
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.display # => "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00"

# FinishOrder & Order

# 1. returns the order list
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
finish = FinishOrder.new(order)
finish.list # => [cheeseburger, hotdog, hotdog]

# 2. returns items, quantities and total in a formatted string
cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
finish = FinishOrder.new(order)
finish.receipt # => "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00\nOrder Total: £5.50"
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# MenuItem

# 1. It creates 
cheeseburger = MenuItem.new("cheeseburger", 2.50)
cheeseburger.name # => "cheeseburger"
cheeseburger.price # => 2.5

# Menu

# 1. returns an empty menu list
menu = Menu.new
menu.list # => []

# 2. adds one item
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
menu = Menu.new
menu.add(cheeseburger)
menu.list # => [cheeseburger]

# 3. adds multiple items
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
menu = Menu.new
menu.add(cheeseburger)
menu.list # => [cheeseburger, hot dog]

# 3. displays one added item in a formatted string
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
menu = Menu.new
menu.add(cheeseburger)
menu.display # => "1. cheeseburger - £2.50"

# 4. displays multiple added items in a formatted string
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
menu = Menu.new
menu.add(cheeseburger)
menu.add(hotdog)
menu.display # => "1. cheeseburger - £2.50\n2. hotdog - £1.50"

# Order

# 1. returns an empty order list
order = Order.new
order.list # =>[]

# 2. adds one item 
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
order = Order.new
order.add(cheeseburger, 1)
order.list # => [cheeseburger]

# 3. adds multiple items 
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.list # => [cheeseburger, hotdog, hotdog]

# 4. removes one item
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.remove(hotdog, 1)
order.list # => [cheeseburger, hotdog]

# 5. removes multiple items
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.remove(cheeseburger, 1)
order.remove(hotdog, 1)
order.list # => [hotdog]

# 6. displays one added item in a formated string
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
order = Order.new
order.add(cheeseburger, 1)
order.display # => "item: cheeseburger, quantity: 1, price: £2.50"

# 7.  displays multiple added items in a formated string
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.display # => "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00"

# FinishOrder

# 1. returns an empty list
order = double(:order)
expect(order).to receive(:list).and_return([])
finish = FinishOrder.new(order)
finish.list # => []

# 2. returns the order list
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
order = double(:order)
expect(order).to receive(:add).with(cheeseburger, 1)
expect(order).to receive(:add).with(hotdog, 2)
order.add(cheeseburger, 1)
order.add(hotdog, 2)
expect(order).to receive(:list).and_return([cheeseburger, hotdog, hotdog])
finish = FinishOrder.new(order)
finish.list # => [cheeseburger, hotdog, hotdog]


# 3. returns items, quantities and total in a formatted string
cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
hotdog = double(:hotdog, name: "hotdog", price: 1.50)
order = double(:order)
expect(order).to receive(:add).with(cheeseburger, 1)
expect(order).to receive(:add).with(hotdog, 2)
order.add(cheeseburger, 1)
order.add(hotdog, 2)
expect(order).to receive(:list).and_return([cheeseburger, hotdog, hotdog])
finish = FinishOrder.new(order)
finish.receipt # => "item: cheeseburger, quantity: 1, price(each): £2.50\nitem: hotdog, quantity: 2, price(each): £1.50\nOrder Total: £5.50"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._