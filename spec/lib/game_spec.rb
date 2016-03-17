require 'spec_helper'

describe Game do

  let(:player) {Player.new("Jerry")}
  let(:dealer) {Dealer.new("Half")}
  let(:game) {Game.new(player, dealer)}

  describe ".new" do
    it "creates a new game with a player and a dealer" do
      expect(game.dealer.class).to eq Dealer
      expect(game.player.class).to eq Player
    end

  end

  describe "#determine_winner" do
    it "has the player win if his score is larger" do
      player.hand << "10♠"
      player.hand << "10♦"
      dealer.hand << "2♠"
      dealer.hand << "4♦"
      expect {game.determine_winner}.to output(/is the winner!/).to_stdout
    end

    it "has the dealer win if his score is larger" do
      player.hand << "3♠"
      player.hand << "3♦"
      dealer.hand << "A♠"
      dealer.hand << "10♦"
      expect {game.determine_winner}.to output(/House wins, time to hit up an ATM!/).to_stdout
    end
  end

end
