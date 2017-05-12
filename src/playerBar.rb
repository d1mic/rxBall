require 'gosu'
require 'rubygems'
class PlayerBar
  attr_accessor :width , :height , :x , :y , :color , :timePower , :typePower , :active1 , :active2 , :speed
  def initialize(x = 320 , y = 400, color = Gosu::Color.argb(0xff_ffffff) , speed = 250)
    @image = Gosu::Image.new("img/bar.png",false)
    @width  = 70
    @height = 10
    @color = color
    @x = x
    @y = y
    @active1 = 0
    @active2 = 0
    @speed = speed

  end
  def move_left(delta)
    @x -= @speed * delta
    if @x < 0
      @x = 0
    end
  end
  def move_right(delta)
    @x += @speed * delta
    if @x + @width > 640
      @x = 640 - @width
    end
  end
  def draw

    @image.draw_as_quad(@x, @y, @color, @x, @y + @height, @color, @x + @width, @y + @height, @color, @x + @width, @y, @color,4)

  end

  def update
    # ako je tip powerupa 1 - ako je proslo 10 sekundi i ako ima aktivnih power-upova smanji visinu i oduzmi jedan powerup sto si sredio
    if(@typePower == 1 && @timePower + 10 <= Time.now.sec && @active1 != 0)
      @width -= 30
      @active1 -= 1
    end

    if(@typePower == 2 && @timePower + 10 <= Time.now.sec && @active2 != 0)
      @speed -= 100
      @active2 -= 1
    end

  end


end
