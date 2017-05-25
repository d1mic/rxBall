require 'gosu'
require 'rubygems'

class Ball
  attr_accessor :x , :y , :angle, :typePower, :timePower, :active3, :vector_x, :vector_y, :speed
  def initialize(x = 320 , y =150, speed = 1)
    @image_ball = Gosu::Image.new("assets/img/ball_gray.png",false)
    @color= Gosu::Color.argb(0xff_ffffff)
    @x = x
    @y = y
    @center_x = 0
    @center_y = 0
    @width = 20
    @height = 20
	  @paused = false
	  @speed = speed
    @vector_x = 3
    @vector_y = 3
    @radius = @width/2
    @active3 = 0
  end

  def pause
    @vx_paused = @vector_x
    @vy_paused = @vector_y
    @vector_x = 0
    @vector_y = 0
    @paused = true
  end
  
  def unpause
	@vector_x = @vx_paused
	@vector_y = @vy_paused
	@paused = false
  end
  
  def toggle_pause
	if @paused
	  unpause
	else
	  pause
	end
  end

  def draw
    @image_ball.draw_as_quad(@x, @y, @color,@x, @y + @height, @color,@x + @width, @y + @height, @color,@x + @width, @y, @color,5)
  end

  def move(delta)

    @x += @vector_x * @speed;
    @y += @vector_y * @speed;

    @center_x = @x + @width/2
    @center_y = @y + @height/2


    CollisionFieldCheck()
  end


  def CollisionFieldCheck() 

    if (@x <= 0) 
      @vector_x= - @vector_x
    end
    if (@center_x + @radius >= 640)
      @vector_x = -@vector_x;
    end
    if (@center_y - @radius <= 0)
      @vector_y = -@vector_y;
    end
    if ( @center_y + @radius >= 480) 
      $endGame = 1
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

  def update
    if(@typePower == 3 && @timePower + 10 <= Time.now.sec && @active3 != 0)
      @speed *= 2
      @active3 -= 1
    end
  end
  
  def jump
    @vector_x =  @vector_x;
    @vector_y = - @vector_y;

  end


end
