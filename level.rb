require 'gosu'
require_relative 'brick.rb'

class Level
	attr_accessor :brick_width, :brick_height
	def initialize
		@brick = Brick.new
		@bricks = Array.new
		@width = @brick.brick_width
		@height = @brick.brick_height
	 
		@pos_h = 60
		@i = 0
		for @i in 0...4
			@j = 0
			@pos_w = 50
			@pos_h += @height
			for @j in 0...@bricks.length
				@bricks << Brick.new
				@bricks[@j].set_pos(@pos_h, @pos_w)
				@bricks[@j].draw
				@j += 1
			end
		end
	end
	
end
