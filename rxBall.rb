require 'gosu'

class RXWindow < Gosu::Window
  # konstruktor za sam prozor koji overrideujes
  def initialize
    super 640, 480
    self.caption = "RX ball"


    @background_image = Gosu::Image.new("img/space.jpg", false)

  end




  def update
    # ...
  end

  def draw
    @background_image.draw(0,0,0)
  end

  # overrideuje se fja button_down koja je vec definisana
  def button_down(button)
    close if button == Gosu::KbEscape
  end

end

RXWindow.new.show
