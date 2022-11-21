require "finish_order"
require "order"

describe "FinishOrder integration" do
  it "returns the order list" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    order = Order.new
    order.add(cheeseburger, 1)
    order.add(hotdog, 2)
    finish = FinishOrder.new(order)
    expect(finish.list).to eq [cheeseburger, hotdog, hotdog]
  end

  it "returns items, quantities and total in a formatted string" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    order = Order.new
    order.add(cheeseburger, 1)
    order.add(hotdog, 2)
    finish = FinishOrder.new(order)
    expect(finish.receipt).to eq "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00\nOrder Total: £5.50"
  end
end
