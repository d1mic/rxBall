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
				
				randNum = rand(0..1000)

				# neke loptice ce imati powerUp da sire samog igraca - zeleno
				if (randNum  % 7 == 0)
					r = rand(0-255)
					g = rand(0-255)
					b = rand(0-255)
					@bricks << Brick.new(@w ,@h, Gosu::Color.argb(255, 0, 204, 0), 1)
				#ubrzavanje player-a - crveno
				elsif (randNum % 9 == 0)
					@bricks << Brick.new(@w ,@h, Gosu::Color.argb(255, 246, 16, 16), 2)
				elsif (randNum % 11 == 0)
				#usporavanje loptice - zuto
					@bricks << Brick.new(@w, @h, Gosu::Color.argb(255, 255, 255, 0), 3)
				#pucanje - plavo
				elsif (randNum % 6 == 0)
					@bricks << Brick.new(@w, @h, Gosu::Color.argb(255, 0, 0, 255), 4)
				#drunk paddle - ljubicasto
				elsif (randNum % 2 == 0)
					@bricks << Brick.new(@w, @h, Gosu::Color.argb(255, 153, 0, 153), 5)
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
