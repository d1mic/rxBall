require 'gosu'

class Ball
  attr_accessor :x , :y , :angle
  def initialize(x = 320 , y =200)
    @image_ball = Gosu::Image.new("img/ball_gray.png",false)
    @color= Gosu::Color.argb(0xff_ffffff)
    @x = x
    @y = y
    @center_x = 0
    @center_y = 0
    @width = 20
    @height = 20

    @radius = @width/2
    @pi2 = Math::PI/2
    @angle = Math::PI/4
  end

  def draw
    @image_ball.draw_as_quad(@x, @y, @color,
                   @x, @y + @height, @color,
                   @x + @width, @y + @height, @color,
                   @x + @width, @y, @color,5)
  end

  def move(delta)
    @x += Math.sin(@angle) * 150 * delta
    @y += Math.cos(@angle) * 150 * delta
    @center_x = @x + @width/2
    @center_y = @y + @height/2


    if( @center_x + @radius >= 640 )
      #@x = 640
      self.jump
    end
    if (@center_x - @radius  <= 0)
      @x = 0
      self.jump
    end
    if (@center_y - @radius <= 0)
      @y = 0
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
