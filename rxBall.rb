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





class RXWindow < Gosu::Window
  # konstruktor za sam prozor koji overrideujes
  def initialize
    super 640, 480
    self.caption = "RX ball"


    @background_image = Gosu::Image.new("img/space.jpg", false)
    @player = PlayerBar.new
    #ovo se poziva ovde jer draw crta na svakih 60msec a ovo se izvrsava samo jednom
    @player.restartPos


  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @player.move_right
    end


  end

  def draw
    @background_image.draw(0,0,0)
    @player.draw

  end

  # overrideuje se fja button_down koja je vec definisana
  def button_down(button)
    close if button == Gosu::KbEscape
  end

end

RXWindow.new.show
