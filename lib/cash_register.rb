class CashRegister

  attr_accessor :discount, :total, :items, :last_item

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    @total += price * quantity
    (1..quantity).each { |index| @items << item}
    @last_item = price
  end

  def apply_discount
    if @discount > 0
      @total = @total - (@total * @discount / 100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item
  end
end
