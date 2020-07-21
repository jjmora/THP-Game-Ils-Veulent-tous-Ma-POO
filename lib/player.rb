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

class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state 
    return "   #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice > @weapon_level 
      @weapon_level = dice
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
      puts "Your new weapon is level: #{@weapon_level}"
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      puts "Your weapon is still level: #{@weapon_level}"
    end
  end

  def search_health_pack
    dice = rand(1..6)
    puts "   => #{dice}"
    if dice == 1
      puts "Tu n'as rien trouvé... "
    else
      if dice >1 && dice < 6
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        @life_points = @life_points + 50
        @life_points > 100 ? (@life_points = 100) : @life_points = @life_points
      else
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
        @life_points = @life_points + 80
        @life_points > 100 ? (@life_points = 100) : @life_points = @life_points
      end
    end
  end

  def all_data_from_human_player
    return "#{@name} | #{@life_points} points | Weapon Level: #{@weapon_level}"
  end
end

