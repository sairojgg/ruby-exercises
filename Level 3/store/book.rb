require_relative "product.rb"
require "../logging.rb"

class Book < Product
    include Logging
    
    VALID_CATEGORIES = ['ADVENTURE', 'ROMANCE', 'SCIFI', 'HORROR']
    attr_accessor = :category
    def initialize name, price, category
        super(name, price)
        @category = (VALID_CATEGORIES.any?{ |s| s.casecmp(category)==0 }) ? category.capitalize : "Others"
        self.log("The category is not valid", :warn) if @category == 'Others'
    end

    def print
        super() + " - #{@category}"
    end
end