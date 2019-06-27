  require 'pry'

  class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 1.76
  end

  def add_item(total, price, quantity = 1)
    self.total += price * quantity
    quantity.times do
      items << total
    end
  end

  def apply_discount
      self.total = @total - (@total * @discount) / 100
      if @discount > 0
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
  end
 end

  def void_last_transaction
    @total = @total - @last_transaction
  end
end
