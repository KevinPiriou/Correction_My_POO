require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
system("clear")
puts "         WELCOME TO".blue.bold
puts "    -ALL WANT MY POO(P)-".blue.bold
puts "===============================".blue.bold
puts "Enter name".yellow.underline
print "> ".yellow.bold
human_name = gets.chomp
human_player = HumanPlayer.new(human_name)
enemy_list = []
player1 = Player.new("Josianne")
player2 = Player.new("José")
enemy_list << player1 
enemy_list << player2
system("clear")

while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts human_player.show_state
  puts "===========================".bold
  puts "     What do want do ?".yellow
  puts "===========================".bold
  puts " [w]Search better weapon ?".blue.bold
  puts " [+]Search healthkit ?".blue.bold
  puts " [1]Attack #{player1.name}".blue.bold
  puts " [2]Attack #{player2.name}".blue.bold
  puts "===========================".bold
  if player1.life_points > 0 
    puts "|#{player1.name} Hp:#{player1.life_points}".yellow.bold 
    player1.show_state
  end
  if player2.life_points > 0
    puts "|#{player2.name} Hp:#{player2.life_points}".blue.bold 
    player2.show_state
  end
  print "> ".yellow.bold
  get = gets.chomp.to_s
  puts 
	
	if get == "w" 
	  sleep(1)
	  human_player.search_weapon
	elsif get == "+" 
	  sleep(1)
	  human_player.search_health_pack
	elsif get == "1"
	  if player1.life_points > 0
	    sleep(1)
	    human_player.attacks(player1)
	  else
	    sleep(1)
	    puts "#{player1.name} is dead, you lost your round !".red
	  end  
	else get == "2"
	  if player2.life_points > 0 
	    sleep(1)
	    human_player.attacks(player2)
	  else
	    sleep(1) 
	    puts "#{player2.name} is dead, you lost your round !".red
	  end
	end
sleep(1)
puts "##### Enemy attack ##### ".red.bold.underline
enemy_list.each do |counter|
	if counter.life_points > 0
	  sleep(2) 
	  counter.attacks(human_player)
    end
    sleep(2)
  end
  puts "##### ROUND FINISH ##### ".red.bold.underline  
end  

if human_player.life_points > 0
  system("clear")
  puts "GG ! YOU WIN".green.bold
  puts "==========================="
  puts "Statistics:".yellow.bold
  puts "#{human_player.show_state}"
  puts "==========================="
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
else
  system("clear") 
  puts "YOU LOSE ! MORE LUCK NEXT TIME".red.bold
  puts
  puts "Statistics:".yellow.bold
  puts "#{human_player.show_state}"
  puts "==========================="
  puts "#{player1.show_state}"
  puts "#{player2.show_state}"
end 