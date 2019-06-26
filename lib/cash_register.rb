class CashRegister
    attr_reader :total, :discount, :items
    attr_writer :total

    def initialize(employee_discount = 0)
        @total = 0
        employee_discount == true
        @discount = employee_discount
        @items = []
        @last_item_name = ""
        @last_item_cost = 0
        @last_quantity
    end

    def add_item(name, cost, count=1)
        @last_quantity = count
        @last_item_cost = cost*count
        @total += @last_item_cost
        for i in (1..count)
            @items << name
        end
    end

    def void_last_transaction
        @items.pop(@last_quantity)
        @total -= @last_item_cost
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        @total -= (@total * @discount)/100
        "After the discount, the total comes to $#{@total}."
    end
    
end
