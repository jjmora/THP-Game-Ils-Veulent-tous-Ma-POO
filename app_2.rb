require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def game_title
  puts "======================================================="
  puts "|      Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|   Le but du jeu est d'etre le dernier survivant !   |"
  puts "=======================================================\n\n"
end


def game_init
  puts game_title

  puts "Please tell me your name :"
  print "  >  "
  user_name = gets.chomp
  return user_name
end

human_player = HumanPlayer.new(game_init)

enemies = []
player1 = Player.new("Josiane")
enemies.push(player1)
player2 = Player.new("Jose")
enemies.push(player2)

while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "\nQuelle action veux-tu effectuer ?\n\n"
  puts "   a - chercher une meilleure arme"
  puts "   s - chercher a se soigner\n\n"
  print "  > "
  input = gets.chomp
  while input != "a" && input != "s" 
    puts "please select a valid option"
    print "  > "
    input = gets.chomp
  end

  if input == "a"
    human_player.search_weapon
  else
    if input == "s" 
      human_player.search_health_pack
    end
  end
  puts human_player.show_state
  print "\nattaquer un joueur en vue :\n\n"
  print "   0 -"
  print player1.show_state
  print "   1 -"
  print player2.show_state
  print "  > "
  input_attack = gets.chomp
  puts "\n"
  while input_attack != "0" && input_attack != "1"
    puts "please select a valid option"
    print "  > "
    input_attack = gets.chomp
  end

  if input_attack == "0"
    human_player.attacks(player1)
  else
    human_player.attacks(player2)
  end
 
  puts "\nLes enemis attaquent !"

  enemies.each do |enemy|
    if enemy.life_points > 0
    enemy.attacks(human_player)
    end
  end
end



if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Tu as perdu !"
end
