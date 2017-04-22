require 'gosu'

class Brick
  attr_accessor :width, :height
  def initialize
	@brick_image = Gosu::Image.new("img/brick.png", false)
	@brick_x = 0
	@brick_y = 0
	@brick_height = @brick_image.height * 0.025
	@brick_width = @brick_image.width * 0.045
  end
  
  def set_pos(x, y)
	@brick_x = x
	@brick_y = y
  end
  
  def brick_width
	@brick_width
  end
  
  def brick_height
	@brick_height
  end
  
  def draw
    @brick_image.draw(@brick_x, @brick_y, 1, 0.045, 0.025)
  end
  
end
