require "menu"
require "menu_item"

describe "Menu integration" do
  it "lists one added menu item" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    menu = Menu.new
    menu.add(cheeseburger)
    expect(menu.list).to eq [cheeseburger]
  end

  it "lists multiple added menu items" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    menu = Menu.new
    menu.add(cheeseburger)
    menu.add(hotdog)
    expect(menu.list).to eq [cheeseburger, hotdog]
  end

  it "returns the menu in a formatted string" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    hotdog = MenuItem.new("hotdog", 1.50)
    menu = Menu.new
    menu.add(cheeseburger)
    menu.add(hotdog)
    expect(menu.display).to eq "1. cheeseburger - £2.50\n2. hotdog - £1.50"
  end
end
