require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def <<(card)
    @cards << card
  end

  def last
    @cards.last
  end

  def calculate_hand
    sum = 0
    @cards.each do |card|
      if ["J","K","Q"].include?(card[0])
        sum += 10
      elsif card[0] == "A"
        sum += 11
      else
        sum += card.to_i
      end
    end
    ace_count = @cards.map { |e| e[0...-1]  }.select{|card| card == "A"}.length
    while sum > 21 and ace_count > 0
      sum -= 10
      ace_count -= 1
    end
    sum
  end
end
