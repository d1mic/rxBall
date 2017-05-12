require 'gosu'

class Brick
  attr_accessor :width, :height , :x , :y , :live

  HEIGHT = 20
  WIDTH = 64


  def initialize(x,y, color = Gosu::Color.argb(0xff_ffffff) , power = 0 )
    @brick_image = Gosu::Image.new("img/brick2.png", false)
    @x = x
    @y = y
    @height = HEIGHT
    @width = WIDTH
    @color = color
    @live = true


    @powerUp = power


  end

  def set_pos(x, y)
	  @x = x
	  @y = y
  end

  def checkPower(playerBar)
    if( @powerUp == 1 )
      # kada se prepozna da je pogodjen powerUp bar sa svojstvom 1 , prosiruje se bar , stavlja se vreme na trenutno , tip na 1 i 
      # active brojac power upa se uvecava 
      playerBar.width += 30;
      playerBar.timePower = Time.new.sec
      playerBar.typePower = 1
      playerBar.active1 += 1
    end
    if( @powerUp == 2)
      playerBar.speed += 100
      playerBar.timePower = Time.new.sec
      playerBar.typePower = 2
      playerBar.active2 += 1
    end

  end

  def draw
    if(@live)
      @brick_image.draw_as_quad(@x, @y, @color,  @x, @y + @height, @color, @x + @width, @y + @height, @color,   @x + @width, @y, @color,5)
    end
  end

end
