class Product
  VALID_DISCOUNT_RANGE = (0.0..1.0)

  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price if price > 0
  end

  def discount(discount_value)
    @price * (1 - discount_value) if VALID_DISCOUNT_RANGE.include?(discount_value)
  end

  def to_s
    "#{self.class.name} - #{@name} - $#{format('%.2f', @price)}"
  end

  def print
    puts to_s
  end
end

class Game < Product
  PLATFORMS = %i[ps4 xbox pc]

  attr_accessor :platform

  def initialize(name, price, platform)
    super(name, price)

    @platform = if PLATFORMS.include? platform
                  platform
                else
                  :pc
                end
  end

  def to_s
    "#{super} - #{@platform}"
  end
end

class Book < Product
  CATEGORIES = %i[adventure scifi romance horror]

  attr_accessor :category

  def initialize(name, price, category)
    super(name, price)

    @category = if CATEGORIES.include? category
                  category
                else
                  :scifi
                end
  end

  def to_s
    "#{super} - #{@category}"
  end
end
