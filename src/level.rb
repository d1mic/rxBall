require 'gosu'
require_relative 'brick.rb'

class Level
	attr_accessor :bricks
	def initialize
		@bricks = []
		@numofBricks = (640 / Brick::WIDTH)
		
		@numofRows = rand(3..6)



		@w = 0
		@h = 0
		for j in 1..@numofRows
			for i in 1..@numofBricks
				
				randNum = rand(0..10)

				if ( randNum  % 7 == 0)
					# neke loptice ce imati powerUp da sire samog igraca
					r = rand(0-255)
					g = rand(0-255)
					b = rand(0-255)
					@bricks << Brick.new(@w ,@h, Gosu::Color.argb(255,r,g,b) , 1)

				elsif (randNum % 9 == 0)
					@bricks << Brick.new(@w ,@h, Gosu::Color.argb(255,255,255,51) , 2)

				else
					@bricks << Brick.new(@w,@h)
				end
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
