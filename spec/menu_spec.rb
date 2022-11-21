require "menu"

describe Menu do
  describe "#list" do
    it "returns an empty menu list" do
      menu = Menu.new
      expect(menu.list).to eq []
    end
  end

  describe "#add" do
    it "adds one item" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      menu = Menu.new
      menu.add(cheeseburger)
      expect(menu.list).to eq [cheeseburger]
    end

    it "adds multiple items" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      menu = Menu.new
      menu.add(cheeseburger)
      menu.add(hotdog)
      expect(menu.list).to eq [cheeseburger, hotdog]
    end
  end

  describe "#display" do
    it "displays one added item in a formatted string" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      menu = Menu.new
      menu.add(cheeseburger)
      expect(menu.display).to eq "1. cheeseburger - £2.50"
    end

    it "displays multiple added items in a formatted string" do
      cheeseburger = double(:cheeseburger, name: "cheeseburger", price: 2.50)
      hotdog = double(:hotdog, name: "hotdog", price: 1.50)
      menu = Menu.new
      menu.add(cheeseburger)
      menu.add(hotdog)
      expect(menu.display).to eq "1. cheeseburger - £2.50\n2. hotdog - £1.50"
    end
  end
end
