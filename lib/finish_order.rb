class FinishOrder
  def initialize(order)
    @order = order.list
  end

  def list
    return @order
  end

  def receipt
    receipt = []
    @order.uniq.each do |item|
      receipt << "item: #{item.name}, quantity: #{@order.count(item)}, price: £#{format(item.price * @order.count(item))}"
    end
    receipt << "Order Total: £#{format(total_cost)}"
    return receipt.join("\n")
  end

  def send_sms
    sms = Sms.new
    sms.send
  end

  private

  def total_cost
    @order.reduce(0) { |sum, item| sum += item.price }
  end

  def format(price)
    "%.2f" % (price)
  end
end
