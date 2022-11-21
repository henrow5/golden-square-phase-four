require "order"

describe Order do
  describe "#list" do
    it "returns an empty list" do
      order = Order.new
      expect(order.list).to eq []
    end
  end

  describe "#add" do
    it "adds one item" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      order = Order.new
      order.add(cheeseburger, 1)
      expect(order.list).to eq [cheeseburger]
    end

    it "adds multiple items" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      order = Order.new
      order.add(cheeseburger, 1)
      order.add(hotdog, 2)
      expect(order.list).to eq [cheeseburger, hotdog, hotdog]
    end
  end

  describe "#remove" do
    it "removes one item" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      order = Order.new
      order.add(cheeseburger, 1)
      order.add(hotdog, 2)
      order.remove(hotdog, 1)
      expect(order.list).to eq [cheeseburger, hotdog]
    end

    it "removes multiple items" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      order = Order.new
      order.add(cheeseburger, 1)
      order.add(hotdog, 2)
      order.remove(cheeseburger, 1)
      order.remove(hotdog, 1)
      expect(order.list).to eq [hotdog]
    end
  end

  describe "#display" do
    it "displays one added item in a formatted string" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      order = Order.new
      order.add(cheeseburger, 1)
      expect(order.display).to eq "item: cheeseburger, quantity: 1, price: £2.50"
    end

    it "displays multiple added items in a formatted string" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      order = Order.new
      order.add(cheeseburger, 1)
      order.add(hotdog, 2)
      expect(order.display).to eq "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00"
    end
  end
end
