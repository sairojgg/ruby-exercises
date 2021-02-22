require "../logging.rb"

class Product
    include Logging

    attr_accessor = :name, :price
    def initialize name, price
        @name = name
        self.log("Price #{price} is not a valid number")
        @price = price.to_f
    end

    def discount! amount
        if (0..100).include? amount 
            @price = (@price - (@price * amount / 100)).round(2)
        else
            self.log("Not a valid discount", :fatal)
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