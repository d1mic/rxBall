require 'gosu'
require_relative 'brick.rb'

class Level
  attr_reader :window
  attr_reader :filename
  attr_reader :width, :height
  attr_accessor :bricks
  
  def initialize(filename)

    @filename = filename
    @bricks = []

	  @lines = File.readlines(@filename)
    @ispravno = false

    @w = 0
    @h = 0
  
  for line in @lines
    for i in 0..line.length
      if line[i] == 'g'
        #prosirenje paddle - zeleno
        @bricks << Brick.new(@w, @h, Gosu::Color.argb(255, 0, 204, 0), 1)
      elsif line[i] == 'r'
        #ubrzavanje paddle - crveno
        @bricks << Brick.new(@w ,@h, Gosu::Color.argb(255, 246, 16, 16), 2)
      elsif line[i] == 'y'
        #usporavanje loptice - zuto 
        @bricks << Brick.new(@w, @h, Gosu::Color.argb(255, 255, 255, 0), 3)
      elsif line[i] == 'p'
        # drunk paddle - ljubicasto
        @bricks << Brick.new(@w, @h, Gosu::Color.argb(255, 153, 0, 153), 5)
      elsif line[i] == 'n'
        # normalno
        @bricks << Brick.new(@w,@h)
      end


      @w += Brick::WIDTH
    end
    @h += Brick::HEIGHT
    @w = 0
  end
end

  
  def draw
		for i in 0..@bricks.length-1
				@bricks[i].draw
		end
  end

  def winGame
      for i in 0..@bricks.length-1
        if (@bricks[i].live)
           return false
        end
      end
  end




end
