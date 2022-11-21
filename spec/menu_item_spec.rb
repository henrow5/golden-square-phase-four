require "menu_item"

describe MenuItem do
  it "creates" do
    cheeseburger = MenuItem.new("cheeseburger", 2.50)
    expect(cheeseburger.name).to eq "cheeseburger"
    expect(cheeseburger.price).to eq 2.5
  end
end
