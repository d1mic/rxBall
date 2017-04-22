require 'gosu'

class Brick
  attr_accessor :width, :height , :x , :y , :live

  HEIGHT = 20
  WIDTH = 64

  def initialize(x,y)
    @brick_image = Gosu::Image.new("img/brick.png", false)
    @x = x
    @y = y
    @height = HEIGHT
    @width = WIDTH
    @color= Gosu::Color.argb(0xff_ffffff)
    @live = true
  end

  def set_pos(x, y)
	  @x = x
	  @y = y
  end

  def draw
    if(@live)
      @brick_image.draw_as_quad(@x, @y, @color,
                     @x, @y + @height, @color,
                     @x + @width, @y + @height, @color,
                     @x + @width, @y, @color,5)
    end
  end

end
