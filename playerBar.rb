require 'gosu'

class PlayerBar
  def initialize
    @image = Gosu::Image.new("img/bar.png",false)
    @pos_x = 0
    @pos_y = 0
  end
  def restartPos
    @pos_x = 240
    @pos_y = 400
  end
  def move_left
    @pos_x -= 5
    #da restartujemo poziciju da ne ide ispod 480 - ekrana
    if @pos_x < 0
      @pos_x = 0
    end
  end
  def move_right
    @pos_x += 5
    #da restartujemo poziciju da ne ide preko 480 - ekrana
    if @pos_x > 480
      @pos_x = 480
    end

  end


  def draw
    @image.draw(@pos_x,@pos_y,1,0.2,0.1)
  end

end

