require_relative 'game.rb'
require_relative 'book.rb'

cart = []
cart << Game.new('Smite', '0', 'PC4')
cart << Book.new('Jekyll and Hyde', '30', 'adventurE')
cart << Game.new('FIFA 20', 59.99, 'PC')
cart << Game.new('God of War', 49.99, 'PS4')
cart << Game.new('Forza Horizon', 49.99, 'XboX')
cart << Book.new('1984', 19.99, 'Horror')
cart << Book.new('Animal Farm', 15.99, 'sciFi')
cart << Book.new('Pride and Prejudice', 12.99, 'romance')

cart.each { |product|
    if product.class.name == 'Book'
        product.discount! 20
    elsif product.class.name == 'Game'
        product.discount! 10
    end
    puts product.print
    puts product.isFree?
}
