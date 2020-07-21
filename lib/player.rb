## 2 joueurs ;
  ## Que chaque joueur ait un niveau de vie donné ;
  ## Que ce niveau de vie baisse à chaque attaque subie ;
      ##le niveau de vie est le même pour tout le monde au début (10 pts de vie)
  ## Si la vie atteint zéro, le personnage est mort.

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = life_points = 10
  end

  def show_state 
    ##  Code une méthode show_state qui va afficher l'état de l'objet Player sur laquelle elle est exécutée : "XXXX a YYY points de vie".
    puts "   #{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    if @life_points <= 0
      puts "The player is already dead !"
    else
      @life_points = @life_points - damage
      if @life_points <= 0 
        puts "le joueur #{@name} a été tué !"
        @life_points = 0
      end
    end
  end


  def attacks(player_name)
    puts "le jouer #{@name} attaque le jouer #{player_name.name}"
    damage = compute_damage
    puts " => #{damage} points"
    player_name.gets_damage(damage)
    puts "#{name} inflige #{damage} points de dommages a #{player_name.name}"
  end

  def compute_damage
    return rand(1..6)
  end
end


