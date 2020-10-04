require_relative './card.rb'
class Deck 
    SUITS = [:Hearts, :Diamonds, :Clubs, :Spades]
    RANK = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

    def initialize
        @cards = SUITS.map{|suit| build(suit)}.flatten.shuffle
    end

    def draw
        @cards.pop
    end

    def build(suit)
        RANK.map {|value| Card.new(value, suit)}
    end
end