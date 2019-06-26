require 'pry'

 class CashRegister

    attr_accessor :discount, :total

    ITEMARRAY = []
    PRICEARRAY = []
    
    def initialize(discount=nil)
        @discount ||= discount
        @total = 0
        ITEMARRAY.clear # ensures that establishing a new register clears ITEMARRAY
                        # research: not necessary for price because cleared in line 31 && 36
    end

    def add_item(title, price, quantity=1)
        # total = (total += (price*quantity)
        # saved from previous solution before making PRICEARRAY:
        # @total += (price * quantity)
        # ---
        # initially had below checking for title and quantity,
        # PRICEARRAY didn't exist. in order to remove most recent
        # transaction, needed a way to save most recent transaction
        # amount. future state: write tests where multiple items are
        # added and ensure that 1. PRICEARRAY properly updates, and
        # 2. void transaction removes PRICEARRAY.last

        
        if title.length > 0 && quantity == 1
            PRICEARRAY.clear
            ITEMARRAY << title
            PRICEARRAY << (price*quantity)
        else # saved from previous solution: title.length > 0 && quantity > 1
            quantity.times do |x|
                PRICEARRAY.clear
                ITEMARRAY << title
            end
            PRICEARRAY << (price*quantity)
        end
        @total += PRICEARRAY.sum
    end

    def apply_discount
        if @discount == nil
            "There is no discount to apply."
        else
            @total -= (@total*(@discount/100.to_f))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        ITEMARRAY
    end

    def void_last_transaction
        @total -= PRICEARRAY.sum
    end
 end