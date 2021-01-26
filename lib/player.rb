class Player
	attr_accessor :name, :life_points
	
	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		return "#{name} have [#{@life_points}:Hp]"
	end

	def gets_damage(damage)
		@life_points = @life_points - damage
		if @life_points <= 0
			puts "##### END FIGHT #####".red.bold.underline
			puts "Player #{name} is down".blue
			@life_points = 0
		end
	end

	def compute_damage
		return rand(1..6)
	end

	def attacks(player)
		puts "Player #{@name} attacks #{player.name}".bold
		damage = compute_damage
		puts "> Give #{damage} damage point".yellow
		player.gets_damage(damage)
		puts player.show_state
		puts ""
	end

end