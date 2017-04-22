require 'gosu'
class Ball
  attr_accessor :x , :y , :angle
  def initialize(x = 320 , y =200)
    @image_ball = Gosu::Image.new("img/ball_gray.png",false)
    @x = x
    @y = y
    @width = 20
    @height = 20
    @radius = @width/2
    @color= Gosu::Color.argb(0xff_ffffff)
    @center_x = 0
    @center_y = 0
    @pi2 = Math::PI/2
    @angle = Math::PI/4
  end

  def draw
    @image_ball.draw_as_quad(@x, @y, @color,
                   @x, @y + @height, @color,
                   @x + @width, @y + @height, @color,
                   @x + @width, @y, @color,5)
  end

  def move
    @x += Math.sin(@angle) * 7
    @y += Math.cos(@angle) * 7
    @center_x = @x + @width/2
    @center_y = @y + @height/2


    if( @center_x + @radius >= 640 || @center_x - @radius  <= 0 || @center_y - @radius <=0)
      self.jump
    end
    if ( @center_y + @radius >= 480)
      exit(-1)
    end
  end


  def RectCircleColliding(rect)
      distX = (@center_x - rect.x - rect.width/2).abs
      distY = (@center_y - rect.y - rect.height/2).abs

      if (distX > (rect.width/2 + @radius))
        return false
      end
      if (distY > (rect.height/2 + @radius))
        return false
      end

      if (distX <= (rect.width/2))
        return true
      end
      if (distY <= (rect.height/2))
        return true
      end

      dx=distX-rect.width/2.0
      dy=distY-rect.height/2.0
      return (dx*dx+dy*dy<=(@radius*@radius))
  end

  def jump
    @angle += @pi2

  end


end
