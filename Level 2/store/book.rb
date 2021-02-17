require_relative "product.rb"

class Book < Product
    VALID_CATEGORIES = ['ADVENTURE', 'ROMANCE', 'SCIFI', 'HORROR']
    attr_accessor = :category
    def initialize name, price, category
        super(name, price)
        @category = (VALID_CATEGORIES.any?{ |s| s.casecmp(category)==0 }) ? category.capitalize : "Others"
    end

    def print
        super() + " - #{@category}"
    end
end