require 'gosu'
require 'rubygems'
require_relative 'src/brick.rb'
require_relative 'src/playerBar.rb'
require_relative 'src/ball.rb'
require_relative 'src/level.rb'


class RXWindow < Gosu::Window
  attr_accessor :delta
  def initialize
    super 640, 480
    self.caption = "RX ball"
    @last_time = Gosu::milliseconds / 1000.0
    @background_image = Gosu::Image.new("img/space.jpg", false)
    @player = PlayerBar.new
    @level = Level.new
    @ball = Ball.new
    @font = Gosu::Font.new(self, "assets/fonts/pixelade-webfont.ttf", 35)
    @score = 0
	
    $endGame = 0

  end

  def update
    self.update_delta

    if Gosu.button_down? Gosu::KB_LEFT
      @player.move_left(@delta)
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @player.move_right(@delta)
    end
    
    @player.update

    @ball.move(@delta)

    #PROVERA KOLIZIJE LOPTE I BAR-a

    if @ball.RectCircleColliding(@player)
      @ball.jump
    end

    # ODRADJENA PROVERA ZA SVAKU CIGLU DA LI JE DOSLO DO KOLIZIJE I DAL JE TREBA OBRISATI , AKTIVIRATI MOC ILI UVECATI SCORE
    for brick in @level.bricks
      if brick.live
        if @ball.RectCircleColliding(brick)
          brick.live = false
          @ball.jump
          brick.checkPower(@player)
          brick.checkPower1(@ball)
          @score += 10

        end
      end
		end

  end

  def draw
    @background_image.draw(0,0,0)
   
    if($endGame == 0)
      @level.draw
      @player.draw
      @ball.draw
      @font.draw("Score: ", 500, 430, 3, 1, 1, Gosu::Color::WHITE)
      @font.draw(@score.to_s, 590, 430 , 3, 1, 1, Gosu::Color::WHITE)
    else
      @font.draw("Game over!", 250 , 200 , 3,1,1, Gosu::Color::WHITE)
      @font.draw("Press esc to go back to main menu", 120, 300 , 3, 1,1 ,Gosu::Color::WHITE)
    end

  end

 
  def button_down(button)
    if button == Gosu::KbEscape
        close!
        Homescreen.new.show
    end
  end

  def update_delta
    current_time = Gosu::milliseconds / 1000.0
    @delta = [current_time - @last_time, 0.25].min
    @last_time = current_time
  end

end
RXWindow.new.show
