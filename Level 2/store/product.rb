class Product
    attr_accessor = :name, :price
    def initialize name, price
        @name = name
        @price = price.to_f
    end

    def discount! amount
        if (0..100).include? amount 
            @price = (@price - (@price * amount / 100)).round(2)
        else
            puts "Not a valid discount"
        end
    end

    def isFree?
        free = @price == 0 ? "Free!" : "Not free."
        "#{@name} is #{free}"
    end

    def print
        "#{self.class.name}: #{@name} - $#{@price}"
    end
end