require "pry"

class CashRegister

    attr_accessor :total, :discount, :last_transaction, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        if quantity > 1
            i = 0
            while i < quantity
                items << title
                i += 1
            end
        else
            @items << title
        end
        @total += price * quantity
        @last_transaction = price * quantity
    end
    
    def apply_discount
        if discount != 0
            @total = (total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        @total = @total - @last_transaction
    end

    # binding.pry 
   
end


