require_relative "hand"

class Dealer < Player

  def action
    puts "Dealer score: #{@hand.calculate_hand}"
    puts ""
    if hand.calculate_hand < 17
      puts "Dealer Hits."
      puts ""
      :hit
    else
      puts "Dealer Stands."
      puts ""
      :stand
    end
  end

end
