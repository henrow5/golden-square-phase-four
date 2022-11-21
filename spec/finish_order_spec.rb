require "finish_order"

describe FinishOrder do
  describe "#list" do
    it "returns an empty list" do
      order = double(:order)
      expect(order).to receive(:list).and_return([])
      finish = FinishOrder.new(order)
      expect(finish.list).to eq []
    end

    it "returns the order list" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "cheeseburger", price: 1.50)
      order = double(:order)
      expect(order).to receive(:add).with(cheeseburger, 1)
      expect(order).to receive(:add).with(hotdog, 2)
      order.add(cheeseburger, 1)
      order.add(hotdog, 2)
      expect(order).to receive(:list).and_return([cheeseburger, hotdog, hotdog])
      finish = FinishOrder.new(order)
      expect(finish.list).to eq [cheeseburger, hotdog, hotdog]
    end
  end

  describe "#receipt" do
    it "returns items, quantities and total in a formatted string" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      order = double(:order)
      expect(order).to receive(:add).with(cheeseburger, 1)
      expect(order).to receive(:add).with(hotdog, 2)
      order.add(cheeseburger, 1)
      order.add(hotdog, 2)
      expect(order).to receive(:list).and_return([cheeseburger, hotdog, hotdog])
      finish = FinishOrder.new(order)
      expect(finish.receipt).to eq "item: cheeseburger, quantity: 1, price: £2.50\nitem: hotdog, quantity: 2, price: £3.00\nOrder Total: £5.50"
    end
  end
end
