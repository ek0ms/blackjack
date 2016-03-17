require_relative 'hand'

class Player
  attr_reader :player, :hand, :name

  def initialize(name)
    @name = name
    @hand = Hand.new([])
  end

  def action
    puts "Player score: #{@hand.calculate_hand}\n\n"
    print "Hit or stand? (Enter 'h' or 's'): "
    choice = gets.chomp
    (choice.downcase == "h") ? :hit : :stand
  end

  def busted?
    (@hand.calculate_hand > 21)
  end

  def add_card(card)
    puts "#{@name} has been dealt the following card: #{card}"
    @hand << card
  end

end
