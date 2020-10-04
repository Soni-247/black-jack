require_relative './card.rb'
require_relative './deck.rb'
require_relative './player_move.rb'
require 'terminal-table'
require 'colorize'

class Game
    attr_accessor :dealer_hand, :player_hand, :playing, :turn, :bet, :bank
    def initialize
        @dealer_hand = []
        @player_hand = []
        @playing = true
        @deck = Deck.new
        @bet = bet.to_i
        @bank = bank.to_i
        @turn = 'Player'
        2.times do 
            @dealer_hand.push(@deck.draw)
            @player_hand.push(@deck.draw)
        end
    end

    def hit
     if @turn == 'Player'
        @player_hand.push(@deck.draw)
     else @turn == 'Dealer'
        @dealer_hand.push(@deck.draw)
     end
    end

# -------------- Player turn ends -------------
    def stand
        if playing
            if @turn == 'Player'
                @turn = 'Dealer'
            end
        end

        result = add_hand(@dealer_hand)
        if result < 17
            hit
        end
    end

    def double_down
        if @bank >= @bet * 2
            @bet *= 2
            hit
            stand
        else
            puts "Not enough money"
        end
    end

    def compare
        player_result = add_hand(@player_hand)
        puts "You have a total value of #{player_result}.".colorize(:cyan).on_light_white
        result = add_hand(@dealer_hand) 
        puts 'Dealer has:'.colorize(:cyan).on_light_white
        @dealer_hand.map{|card| puts card.to_c}
        puts "Dealer has a total value of #{result}.".colorize(:cyan).on_light_white

        if player_result > 21
            puts 'You Bust!'.colorize(:red).on_white
            @bank -= @bet
        elsif result > 21 && player_result > 21
            puts 'You Bust!'.colorize(:red).on_white
            @bank -= @bet
        elsif player_result < result && result <= 21
            puts 'You Lose!'.colorize(:black).on_white
            @bank -= @bet

        elsif player_result > result && player_result <= 21
            puts 'You Win!'.colorize(:green).on_white
            @bank += @bet
        elsif result > 21 && player_result <= 21
            puts 'Dealer has a Bust!'.colorize(:cyan).on_light_white
            puts 'You Win!'.colorize(:green).on_white
            @bank += @bet
        else player_result == result
            puts 'Tie!'.colorize(:green).on_white
        end
    end

    def print_board
        puts "Dealer is showing".colorize(:cyan).on_white
        puts @dealer_hand[1].to_c
        rows = @player_hand.map {|card| [card.to_s, Ranking[card.value.to_s]]}
        rows << ["Total" , add_hand(@player_hand)]
        
        difference =  21 - add_hand(@player_hand).to_i
        if difference >= 0
            rows << ["Until 21", 21 - add_hand(@player_hand).to_i]
        else difference < 0
            rows << ["Until 21", "BUST!".colorize(:red)]
            stand
        end
        table = Terminal::Table.new :title => "Cheatsheet", :headings => ['Cards', 'Sum'], :rows => rows
        puts table
    end

    Ranking = {
        'Ace' => 11,
        '2' => 2,
        '3' => 3,
        '4' => 4, 
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        '10' => 10,
        'Jack' => 10,
        'Queen' => 10,
        'King' => 10,
    }    

    private

    def add_hand(hand)
        sum = hand.map{|card| card.value}
        result = sum.reduce(0) { |num, rank| num + Ranking[rank.to_s]}
        if sum.include?('Ace') && result > 21
            result -= 10
        end
        result
    end

end