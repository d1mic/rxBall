require 'gosu'
require_relative 'brick.rb'

class Level
	attr_accessor :bricks
	def initialize
		@bricks = []
		@numofBricks = (640 / Brick::WIDTH)
		@numofRows = 7

		@w = 0
		@h = 0
		for j in 1..@numofRows
			for i in 1..@numofBricks
				@bricks << Brick.new(@w ,@h)
				@w += Brick::WIDTH
			end
			@h += Brick::HEIGHT
			@w = 0
		end
end
	def draw
		for i in 0..(@numofBricks)*@numofRows -1
				@bricks[i].draw
		end
	end
end
