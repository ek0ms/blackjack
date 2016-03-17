require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new(["10♦", "J♥"]) }
  let(:hand_ace_hi) { Hand.new(["A♦", "J♥", "J♥"]) }
  let(:hand_ace_lo) { Hand.new(["A♦", "J♥"]) }
  let(:many_aces) { Hand.new(["A♦","A♦","A♦","A♦","A♦","A♦" ]) }

  describe "#calculate_hand" do
    it "adds the values of all the cards" do
      expect(hand.calculate_hand).to eq(20)
    end

    it "counts ace as one if 11 would break the hand" do
      expect(hand_ace_hi.calculate_hand).to eq(21)
    end

    it "counts ace as eleven if hand is low" do
      expect(hand_ace_lo.calculate_hand).to eq(21)
    end

    it "works on numberous aces" do
      expect(many_aces.calculate_hand).to eq(16)
    end


  end
end
