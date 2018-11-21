class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_item_price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item_price = nil
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times {self.items << title}
    @last_item_price = price
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * discount / 100)
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @last_item_price
  end


end
