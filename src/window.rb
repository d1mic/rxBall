require 'gosu'
require 'rubygems'
require_relative 'brick.rb'
require_relative 'playerBar.rb'
require_relative 'ball.rb'
require_relative 'level1.rb'

LEVEL = 1

class RXWindow < Gosu::Window
  attr_accessor :delta
  def initialize
    super 640, 480
    self.caption = "RX ball"

    @mainSong = Gosu::Song.new("assets/music/main.wav")
    @mainSong.play(true)
    @last_time = Gosu::milliseconds / 1000.0
    @background_image = Gosu::Image.new("assets/img/space.jpg", false)
    @player = PlayerBar.new
    @ball = Ball.new
    @lvlNum = 1;
    @level = Level.new("levels/lvl#{@lvlNum}.txt")
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
    @ball.update
    @ball.move(@delta)

    #PROVERA KOLIZIJE LOPTE I BAR-a

    if @ball.RectCircleColliding(@player)
      @ball.jump
    end

    if @level.winGame
        @lvlNum += 1
        @level = Level.new("levels/lvl#{@lvlNum}.txt")
    end

    # ODRADJENA PROVERA ZA SVAKU CIGLU DA LI JE DOSLO DO KOLIZIJE I DAL JE TREBA OBRISATI , AKTIVIRATI MOC ILI UVECATI SCORE
    for brick in @level.bricks
      if brick.live
        if @ball.RectCircleColliding(brick)
          @ball.jump
          brick.live = false
          brick.checkPower(@player,@ball)
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
      @font.draw("Level: ", 50, 430, 3, 1, 1, Gosu::Color::WHITE)
      @font.draw(@lvlNum.to_s, 140, 430 , 3, 1, 1, Gosu::Color::WHITE)
      @font.draw("Score: ", 500, 430, 3, 1, 1, Gosu::Color::WHITE)
      @font.draw(@score.to_s, 590, 430 , 3, 1, 1, Gosu::Color::WHITE)
    else
      @mainSong.stop
      @font.draw("Game over!", 250 , 100 , 3,1,1, Gosu::Color::WHITE)
      @font.draw("Score: ", 270, 150, 3, 1, 1, Gosu::Color::WHITE)
      @font.draw(@score.to_s, 290, 200 , 3, 1, 1, Gosu::Color::WHITE)
      @font.draw("Press esc to go back to main menu", 120, 300 , 3, 1,1 ,Gosu::Color::WHITE)
    end

  end



 
  def button_down(button)
    if button == Gosu::KbEscape
        @mainSong.stop
        if($game != nil) 
          $game.close
        end
        if($home != nil) 
          $home.close!
        end
        $home = Homescreen.new.show
        self.close!
    end
    if button == Gosu::KbM
      if @mainSong.playing?
        @mainSong.pause
      else
        @mainSong.play(true)
      end
    end

	 if button == Gosu::KbP
	   @ball.toggle_pause
	   @player.toggle_pause

     if @mainSong.paused?
      @mainSong.play(true)
     else
      @mainSong.pause
     end

    end
    if button == Gosu::KbN
      @lvlNum += 1
      @level = Level.new("levels/lvl#{@lvlNum}.txt")
      @ball.reset_location
    end
  end

  def update_delta
    current_time = Gosu::milliseconds / 1000.0
    @delta = [current_time - @last_time, 0.25].min
    @last_time = current_time
  end



end
