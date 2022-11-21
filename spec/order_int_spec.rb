require "order"
require "menu_item"

describe "Order integration" do
  it "adds one item" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    order = Order.new
    order.add(cheeseburger, 1)
    expect(order.list).to eq [cheeseburger]
  end

  it "adds multiple items" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    order = Order.new
    order.add(cheeseburger, 1)
    order.add(hotdog, 2)
    expect(order.list).to eq [cheeseburger, hotdog, hotdog]
  end

  it "removes one item" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    order = Order.new
    order.add(cheeseburger, 1)
    order.add(hotdog, 2)
    order.remove(hotdog, 1)
    expect(order.list).to eq [cheeseburger, hotdog]
  end

  it "removes multiple items" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    order = Order.new
    order.add(cheeseburger, 1)
    order.add(hotdog, 2)
    order.remove(cheeseburger, 1)
    order.remove(hotdog, 1)
    expect(order.list).to eq [hotdog]
  end

  it "displays one added item in a formatted string" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    order = Order.new
    order.add(cheeseburger, 1)
    expect(order.display).to eq "item: cheeseburger, quantity: 1, price: £2.50"
  end

  it "displays multiple added items in a formatted string" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    order = Order.new
    order.add(cheeseburger, 1)
    order.add(hotdog, 2)
    expect(order.display).to eq "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00"
  end
end
