require 'gosu'
class Ball
  attr_accessor :ball_x , :ball_y , :ball_angle
  def initialize(ball_x = 320 , ball_y =200)
    @image_ball = Gosu::Image.new("img/ball_gray.png",false)
    @ball_x = ball_x
    @ball_y = ball_y
    @width = @image_ball.width
    @height = @image_ball.height
    print @width,@height

    @ball_angle = Math::PI/4
  end

  def draw
    @image_ball.draw(@ball_x,@ball_y,1,1,1)
  end

  def move
    @ball_x += Math.sin(@ball_angle) *5
    @ball_y += Math.cos(@ball_angle) *5


    if(@ball_x + @width > 620 || @ball_x < 0 || @ball_y <0)
      self.jump
    end
    if ( @ball_y + @height > 480)
      close
    end
  end
  def checkCollisionPaddle(paddle)
    if(@ball_y + @height >= paddle.pos_y and
      @ball_x + @width >= paddle.pos_x and
      @ball_x <= paddle.pos_x + paddle.width)
      self.jump
    end


  end






  def jump
    @ball_angle += Math::PI/2
  end


end
