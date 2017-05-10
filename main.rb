require 'gosu'
require 'rubygems'
require_relative 'window.rb'
require_relative 'src/brick.rb'
require_relative 'src/playerBar.rb'
require_relative 'src/ball.rb'
require_relative 'src/level.rb'
require_relative 'homescreen.rb' 

$window = Homescreen.new
$window.show

