require 'bundler'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


system("clear")
puts "         WELCOME TO".blue.bold
puts "    -ALL WANT MY POO(P)-".blue.bold
puts "===============================".blue.bold
puts "Enter name".yellow.underline
print "> ".yellow.bold
name_human = gets.chomp
game = Game.new(name_human)
system("clear")

while  game.is_still_ongoing?
  game.menu
  print "> ".yellow.bold
  get = gets.chomp.to_s
  game.menu_choice(get)
  game.enemy_attack
end

game.finish  