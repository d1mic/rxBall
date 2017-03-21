require 'gosu'

class Brick
  def initialize
	@brick_image = Gosu::Image.new("img/brick.png", false)
	@brick_x = 0
	@brick_y = 0
  end
  
  def set_pos(x, y)
	@brick_x = x
	@brick_y = y
  end
  
  def draw
    @brick_image.draw(@brick_x, @brick_y, 1, 0.045, 0.025)
  end
  
end
