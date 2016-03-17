require 'spec_helper'

describe Dealer do
  let(:dealer) {Dealer.new("Quententius")}
  describe ".new" do
    it "creates a Dealer object with a name equal to 'name'" do
      expect(dealer.name).to eq("Quententius")
    end
  end

  describe "#action" do
    it "hits if current count is under 17" do
      dealer.hand << "J♠"
      expect(dealer.action).to eq(:hit)
    end

    it "stands if current count is 17 or over" do
      dealer.hand << "J♠"
      dealer.hand << "J♠"
      expect(dealer.action).to eq(:stand)
    end

  end
end
