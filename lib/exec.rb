require_relative "menu_item"
require_relative "menu"
require_relative "order"
require_relative "finish_order"
require_relative "sms"

cheeseburger = MenuItem.new("cheeseburger", 2.50)
hotdog = MenuItem.new("hotdog", 1.50)
chips = MenuItem.new("chips", 1.00)
coke = MenuItem.new("coke", 0.99)
menu = Menu.new
menu.add(cheeseburger)
menu.add(hotdog)
menu.add(chips)
menu.add(coke)
order = Order.new
order.add(cheeseburger, 1)
order.add(hotdog, 2)
order.add(chips, 1)
order.add(coke, 1)
finish = FinishOrder.new(order)
puts finish.receipt
# finish.send_sms
