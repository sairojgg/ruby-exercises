require_relative "product.rb"

class Game < Product
    VALID_PLATFORMS = ['PS4', 'PS5', 'XBOX ONE', 'PC']
    attr_accessor = :platform
    def initialize name, price, platform
        super(name, price)
        @platform = (VALID_PLATFORMS.include? platform) ? platform : "Generic"
    end

    def print
        super() + " - #{@platform}"
    end
end