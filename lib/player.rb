require 'better_errors'
require 'pry'
require 'colorize'




class Player
	attr_accessor :name, :life_points										#caractéristique
	
	def initialize(name)																#creation des bots
		@name = name
		@life_points = 10
	end

	def show_state
		return "#{name} [HP:#{@life_points}]".blue.bold
	end

	def gets_damage(damage)
		@life_points = @life_points - damage
		if @life_points <= 0
			puts "#####= ONE KILL =#####".red.bold
			puts
			puts "Player #{name} is dead".blue.bold
			@life_points = 0
		end
	end

	def compute_damage
		return rand(1..6)
	end

	def attacks(player)
		puts "Player #{@name} attack #{player.name}".bold
		damage = compute_damage
		puts "> Give #{damage} damage".yellow
		player.gets_damage(damage)
		puts player.show_state
		puts
	end

end

class HumanPlayer < Player 												#HumanPlayer hérite Player
	attr_accessor :weapon_level, :life_points 				#Caractéristique

	def initialize(name)														#Creation du joueur
	  @weapon_level = 1 
	  @life_points = 100
	  @name = name.upcase
	end
	
	def show_state																	#Etat du joueur
		puts "#{@name}".green.bold
		puts "Hp: #{@life_points}".green.bold
		puts "Weapon lvl: #{@weapon_level}".green.bold
	end
	
	def compute_damage															#Damage en fonction de l'arme
	  rand(1..6) * @weapon_level
	end

	def search_weapon 
	  weapon_lvl = rand(1..6)
	  puts "You found a weapon: lvl #{weapon_lvl} !".blue.bold
	  if weapon_lvl > @weapon_level
	    @weapon_level = weapon_lvl
			puts "Damn! Really good weapon, take it !.".green.bold
			sleep(2)
	  else 
			puts "Shit.. More luck next time !".red.bold
			sleep(2)
	  end  
	end
	
	def search_health_pack
	  nb = rand(1..6)
	  if nb == 1
			puts "Nothing ! ".red.bold
			sleep(2)
	  elsif nb >= 2 && 5 >= nb
	    @life_points = @life_points + 50
	      if @life_points > 100
		@life_points = 100
	      end 
			puts "+50Hp for you !".green.bold
			sleep(2)
	  else 
	    @life_points = @life_points + 80
	      if @life_points > 100
		@life_points = 100
	      end
			puts "+80Hp. Damn !".green.bold
			sleep(2)	  
	  end   
	end	
end  