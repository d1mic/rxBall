require 'gosu'
require_relative 'brick.rb'
require_relative 'playerBar.rb'
require_relative 'ball.rb'
require_relative 'level.rb'

class RXWindow < Gosu::Window
  # konstruktor za sam prozor koji overrideujes
  def initialize
    super 640, 480
    self.caption = "RX ball"


    @background_image = Gosu::Image.new("img/space.jpg", false)
    @player = PlayerBar.new



	@level = Level.new

    @ball = Ball.new
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @player.move_right
    end

    @ball.move
    @ball.checkCollisionPaddle(@player)
  end

  def draw
    @background_image.draw(0,0,0)
#    @brick.draw
    @player.draw
    @ball.draw
  end

  # overrideuje se fja button_down koja je vec definisana
  def button_down(button)
    close if button == Gosu::KbEscape
  end

end

RXWindow.new.show
