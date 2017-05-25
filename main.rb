require 'gosu'
require 'rubygems'
require_relative 'src/window.rb'
require_relative 'src/brick.rb'
require_relative 'src/playerBar.rb'
require_relative 'src/ball.rb'
require_relative 'src/level1.rb'
require_relative 'src/homescreen.rb' 

$game_in_progress = 0
$game = nil
$home = Homescreen.new.show


