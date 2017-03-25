require 'gosu'
class Ball
  def initialize(ball_x = 320 , ball_y =200)
    @image_ball = Gosu::Image.new("img/ball_gray.png",false)

    @ball_x = ball_x
    @ball_y = ball_y
    @ball_vx = 0;
    @ball_vy = 0.5;
    @ball_angle = Math::PI/4
  end

  def draw
    @image_ball.draw_rot(@ball_x,@ball_y,1,0)
  end

  def move
    @ball_x += Math.sin(@ball_angle) *2
    @ball_y += Math.cos(@ball_angle) * 2


    if(@ball_x > 620 || @ball_x < 0 || @ball_y > 480 || @ball_y<0)
      self.jump
    end
  end
  def jump
    @ball_angle += Math::PI/2
  end


end
