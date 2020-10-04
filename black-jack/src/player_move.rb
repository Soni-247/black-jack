require_relative './card.rb'
require_relative './deck.rb'


class Player 
    attr_reader  :name
    attr_accessor :name, :bank 
    def initialize(name, bank)
        @name = name
        @bank = bank
    end
end