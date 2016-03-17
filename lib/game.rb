require_relative "player"
require_relative "dealer"
require_relative "deck"

class Game

  attr_reader :player, :dealer

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @deck = Deck.new
  end

  def play
    puts "Welcome to BlackJack!"
    puts "\n-- Player: #{@player.name}"
    puts "-- Dealer: #{@dealer.name}\n\n"
    2.times {@player.add_card(@deck.deal(1))}
    player_turn
    2.times {@dealer.add_card(@deck.deal(1))}
    puts ""
    if(@player.busted?)
      puts "#{@player.name} has busted! #{@dealer.name}, the dealer, has won!"
    else
      dealer_turn
      if @dealer.busted?
        puts "The Dealer has busted! #{@player.name}, has won!"
      else
        determine_winner
      end
    end

  end

  def player_turn
    puts ""
    last_choice = nil
    while(@player.hand.calculate_hand <= 21 and last_choice != :stand)
      last_choice = @player.action
      @player.add_card(@deck.deal(1)) if last_choice == :hit
    end
    puts ""
  end

  def dealer_turn
    last_choice = nil
    while(@dealer.hand.calculate_hand <= 21 and last_choice != :stand)
      last_choice = @dealer.action
      @dealer.add_card(@deck.deal(1)) if last_choice == :hit
    end
  end

  def determine_winner
    if(@player.hand.calculate_hand > @dealer.hand.calculate_hand)
      puts "#{@player.name} is the winner!"
    else
      puts "House wins, time to hit up an ATM!"
    end
  end


end
