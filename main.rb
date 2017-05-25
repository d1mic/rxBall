require 'gosu'
require 'rubygems'
require_relative 'src/window.rb'
require_relative 'src/brick.rb'
require_relative 'src/playerBar.rb'
require_relative 'src/ball.rb'
require_relative 'src/level1.rb'
require_relative 'src/homescreen.rb' 


$window = Homescreen.new
$window.show

