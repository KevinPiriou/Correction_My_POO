require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

system("clear")
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "Here are the two fighters of today : #{player1.name} vs #{player2.name}".yellow
puts ""
sleep(2)
puts "All fighters have 10 life point".yellow
puts ""
sleep(2)
puts "Let the battle begin".yellow
puts ""
puts "---------------------------"
puts "Player state :".red
puts "#{player1.show_state}".blue
puts "#{player2.show_state}".blue
puts ""
sleep(2)
while player1.life_points > 0 && player2.life_points > 0
	puts "##### Player1 #####".green.bold.underline  
  	player1.attacks(player2) 
  	sleep(3)

  if player1.life_points > 0 && player2.life_points > 0
    puts "##### Player2 #####".green.bold.underline  
    player2.attacks(player1)
    sleep(3)
elsif player1.life_points == 0 || player2.life_points == 0
	break
end

end 