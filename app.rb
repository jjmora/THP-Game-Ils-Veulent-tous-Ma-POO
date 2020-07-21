require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

player3 = HumanPlayer.new("Ana")

=begin
count = 0
  while player1.life_points > 0 && player2.life_points > 0
    count += 1
    puts "Voici l'état de chaque joueur :"
    print player1.show_state
    print player2.show_state
    puts "\nFIGHT! - Passons à la phase d'attaque :"

    player1.attacks(player2)
    player2.life_points > 0 ? player2.attacks(player1) : "Player 1 wins!"
    puts "\n"
  end

  player1.life_points > 0 ? (puts "\n******player1 Wins in #{count} rounds !******\n") : (puts "\n******player2 Wins in #{count} rounds !******\n")

=end

binding.pry