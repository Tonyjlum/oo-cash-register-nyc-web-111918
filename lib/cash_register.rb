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
    self.last_item_price = price
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total -= (self.total * discount / 100)
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_price
  end


end
