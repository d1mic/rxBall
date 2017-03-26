require 'gosu'

class PlayerBar
  attr_accessor :width , :height , :pos_x , :pos_y
  def initialize(pos_x = 320 , pos_y = 400)
    @image = Gosu::Image.new("img/bar.png",false)
    @width  = @image.width * 0.2
    @height = @image.height * 0.1
    @pos_x = pos_x
    @pos_y = pos_y
  end
  def move_left
    @pos_x -= 5
    if @pos_x < 0
      @pos_x = 0
    end
  end
  def move_right
    @pos_x += 5
    if @pos_x + @width > 640
      @pos_x = 640 - @width
    end
  end
  def draw
    @image.draw(@pos_x,@pos_y,1,0.2,0.1)
  end

end
