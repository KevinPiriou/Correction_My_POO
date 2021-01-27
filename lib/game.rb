require 'better_errors'
require 'pry'
require 'colorize'
require_relative 'player'



class Game < HumanPlayer 
	attr_accessor :human_player, :enemies 

	def initialize(name)
	 counter = 0
	 @enemy = []
	 while counter < 4
	   @enemy << Player.new("CPU-#{counter}")
	   counter = counter + 1
	 end  
	 @human_player = HumanPlayer.new(name) 
	end


def kill_player(player)
  @enemy.delete(player)
end

def is_still_ongoing?
  return @human_player.life_points > 0 && @enemy.size != 0
end
	
def show_players
  @human_player.show_state
  puts "Enemy remaining: #{@enemy.size} players"
end 
	
def menu 
  @human_player.show_state
  puts "Enemy remaining: #{@enemy.size} players".green.bold
  puts "===========================".blue.bold
  puts "     What do want do ?".yellow
  puts "===========================".blue.bold
  puts " [w]Search better weapon ?".blue.bold
  puts " [+]Search healthkit ?".blue.bold
  puts " [0]Attack CPU-0".blue.bold
  puts " [1]Attack CPU-1".blue.bold
  puts " [2]Attack CPU-2".blue.bold
  puts " [3]Attack CPU-3".blue.bold
  puts "===========================".blue.bold
	    counter = 0 
	    while counter < @enemy.size 
	      puts "#{counter} - " 
	      @enemy[counter].show_state
	      counter = counter + 1
	    end 
 	end

def menu_choice(get)
	counter = 0
	if get == "w"
	  sleep(1)
	  @human_player.search_weapon
	elsif get == "+"
	  sleep(1)
	  @human_player.search_health_pack
  end 
	while counter < @enemy.size
	  if get == "#{counter}"
	    @human_player.attacks(@enemy[counter])  	
	  end 
	  if @enemy[counter].life_points <= 0
	    kill_player(@enemy[counter])
	  end
	  counter = counter + 1 
	end 
end 

def enemy_attack
  puts "##### ENEMY ATTACK ##### ".red.bold.underline
  @enemy.each do |counter|
  if counter.life_points > 0
    if @human_player.life_points <= 0
      break
    end
    sleep(2) 
    counter.attacks(@human_player)
  end
  end
  puts "##### ROUND FINISH ##### ".red.bold.underline  
end

def finish 
 	if human_player.life_points > 0
    system("clear")
    puts "GG ! YOU WIN".green.bold
    puts "==========================="
    puts "Statistics:".yellow.bold
    puts "#{human_player.show_state}"
    puts "==========================="
  else
    system("clear") 
    puts "YOU LOSE ! MORE LUCK NEXT TIME".red.bold
    puts
    puts "Statistics:".yellow.bold
    puts "#{human_player.show_state}"
    puts "==========================="
  end
end 
end