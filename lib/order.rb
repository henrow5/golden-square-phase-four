class Order
  def initialize
    @order = []
  end

  def list
    return @order
  end

  def add(item, number)
    number.times { @order << item }
  end

  def remove(item, number)
    number.times { @order.delete_at(@order.find_index(item)) }
  end

  def display
    output = []
    @order.uniq.each do |item|
      output << "item: #{item.name}, quantity: #{@order.count(item)}, price: £#{"%.2f" % (item.price * @order.count(item))}"
    end
    return output.join("\n")
  end
end
