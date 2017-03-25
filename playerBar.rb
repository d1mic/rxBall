require 'gosu'

class PlayerBar
  def initialize(pos_x = 320 , pos_y = 400)
    @image = Gosu::Image.new("img/bar.png",false)

    #width i height su geteri od klase image
    @width  = @image.width * 0.2
    @height = @image.height * 0.1
    @pos_x = pos_x
    @pos_y = pos_y
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
    if @pos_x > 640
      @pos_x = 640
    end

  end


  def draw
    @image.draw_rot(@pos_x,@pos_y,1,0,0.5,0.5,0.2,0.1)
  end

end
