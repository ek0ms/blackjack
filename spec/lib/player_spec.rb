require 'spec_helper'

describe Player do
    let(:player) {Player.new("Jerry")}

    describe ".new" do

      it "creates a player class with name 'name' " do
        expect(player.name).to eq("Jerry")
      end

    end

    describe "#action" do
      it "adds a card when hit is selected" do
        allow(player).to receive(:gets).and_return("h")
        expect(player.action).to eq(:hit)
      end

      it "does nothing when stand is selected" do
        allow(player).to receive(:gets).and_return("s")
        expect(player.action).to eq(:stand)
      end

    end

    describe "#add_card" do
      it "adds a card to the players hand" do
        player.add_card("J♠")
        player.add_card("J♣")
        expect(player.hand.last).to eq("J♣")
      end
    end

end
