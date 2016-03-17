require_relative "game"

player = Player.new("Paul")
computer = Dealer.new("Giddeon")

game = Game.new(player, computer)

game.play
