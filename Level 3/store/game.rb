require_relative "product.rb"
require "../logging.rb"

class Game < Product
    include Logging

    VALID_PLATFORMS = ['PS4', 'PS5', 'XBOX ONE', 'PC']
    attr_accessor = :platform
    def initialize name, price, platform
        super(name, price)
        @platform = (VALID_PLATFORMS.include? platform) ? platform : 'Generic'
        self.log("The platform is not valid", :warn) if @platform == 'Generic'
    end

    def print
        super() + " - #{@platform}"
    end
end