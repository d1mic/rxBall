require 'gosu'

class Homescreen < Gosu::Window
    FONT_ASSETS = { font: "assets/fonts/pixelade-webfont.ttf" }

   def initialize
		super 640, 480
		self.caption = "RX Ball"
		@image = Gosu::Image.new("assets/img/logo.png", false)
		@menuSong = Gosu::Sample.new("assets/music/menu.wav")
		@background_image = Gosu::Image.new("assets/img/milky-way-galaxy.jpg", false )
		@height = 150
    	@width = 150
    	@color= Gosu::Color.argb(0xff_ffffff)

    	@select = 310

    	@credits = 0
		self.load_assets
    end

	def load_assets
		@font= Gosu::Font.new(self, FONT_ASSETS[:font], 40)
    end

	def draw
	    @background_image.draw(0,0,0)
	    if( @credits == 0)
	    	@x = 250
	    	@y= 100
			@image.draw_as_quad(@x, @y, @color, @x + @width, @y, @color,@x + @width, @y + @height, @color, @x, @y + @height, @color,5)
			@font.draw("*" , 200 , @select ,3,1,1 , Gosu::Color::WHITE)
			@font.draw("new game" , 250, 300 ,3,1,1 , Gosu::Color::WHITE)
			@font.draw("credits", 250, 330, 3, 1, 1, Gosu::Color::WHITE)
			@font.draw("quit game", 250, 360, 3, 1, 1, Gosu::Color::WHITE)
	   		@font.draw("click space to select", 20, 10, 3, 1, 1, Gosu::Color::WHITE)
	   	else
			@font.draw("Game Developed by:" , 170, 100 ,3,1,1 , Gosu::Color::WHITE)
			@font.draw("Nikola Dimic", 200, 150, 3, 1, 1, Gosu::Color::WHITE)
			@font.draw("Dragana Dimitrijevic", 200, 200, 3, 1, 1, Gosu::Color::WHITE)
			@font.draw("Programske Paradigme 2017", 20, 430, 3, 1, 1, Gosu::Color::WHITE)

	   		@font.draw("press esc to go back", 20, 10, 3, 1, 1, Gosu::Color::WHITE)

		end
	end

	def button_down(button)
		if button == Gosu::KbSpace && @select == 310 && @credits == 0
				@menuSong.play

				if($home  != nil)
					$home.close!
				end
				if( $game != nil)
					$game.close!
				end

				$game = RXWindow.new.show
				self.close!

    	end

    	if button == Gosu::KbSpace && @select == 340 && @credits == 0
    		@menuSong.play
    		@credits = 1
    	end

    	if button == Gosu::KbSpace && @select == 370 && @credits == 0
    		@menuSong.play
    		if($home != nil)
    			$home.close!
    		end
    		self.close!
    	end
    	if button == Gosu::KbEscape && @credits ==1
    		@credits = 0
    	end

    	if button == Gosu::KbDown && @credits ==0
    		@menuSong.play
    		if(@select < 370)
				@select += 30 
			end
    	end
    	if button == Gosu::KbUp && @credits == 0
    		@menuSong.play
    		if(@select > 310)
				@select -= 30 
			end
    	end
	end
end
