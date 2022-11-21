class Menu
  def initialize
    @menu = []
  end

  def list
    return @menu
  end

  def add(item)
    @menu << item
  end

  def display
    output = []
    @menu.uniq.each_with_index do |item, index|
      output << "#{index + 1}. #{item.name} - £#{"%.2f" % (item.price)}"
    end
    return output.join("\n")
  end
end
