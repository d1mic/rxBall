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
	puts @lines
    x = 0
    y = 0
    
    @lines.each do |char|
      @brick_color = colors[char]
      if @brick_color == 'n'
        # create a brick here
        @brick = Brick.new(x, y, brick_color, 1)
      elsif @brick_color == 'r'
        @brick = Brick.new(x, y, brick_color, 2)
      elsif @brick_color == 'y'
        @brick = Brick.new(x, y, brick_color, 3)        
      elsif @brick_color == 'b'
        @brick = Brick.new(x, y, brick_color, 4)
      elsif @brick_color == 'p'
        @brick = Brick.new(x, y, brick_color, 5)        
      elsif @brick_color == 'g'
        @brick = Brick.new(x, y, brick_color)        
      end
      @bricks << @brick
      x += Brick::WIDTH + 0
      if x == 640
		x = 0
	  end
	  
      y += Brick::HEIGHT + 0
    end
  end
  
  def draw
		for i in 0..@bricks.length
				@bricks[i].draw
		end
  end
  
  def colors
    {
      "g" => :grey,
      "p" => :purple,
      "n" => :green,
      "y" => :yellow,
      "r" => :red,
      "b" => :blue
    }
  end
end
