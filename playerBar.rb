require 'gosu'
require 'rubygems'
class PlayerBar
  attr_accessor :width , :height , :x , :y , :color
  def initialize(x = 320 , y = 400)
    @image = Gosu::Image.new("img/bar.png",false)
    @width  = 70
    @height = 10
    @color= Gosu::Color.argb(0xff_ffffff)
    @x = x
    @y = y
  end
  def move_left
    @x -= 10
    if @x < 0
      @x = 0
    end
  end
  def move_right
    @x += 10
    if @x + @width > 640
      @x = 640 - @width
    end
  end
  def draw
    #print Gosu::milliseconds / 1000.0
    #print "\n"
    @image.draw_as_quad(@x, @y, @color,
                   @x, @y + @height, @color,
                   @x + @width, @y + @height, @color,
                   @x + @width, @y, @color,4)
  end

end
