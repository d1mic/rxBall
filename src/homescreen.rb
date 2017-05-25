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

		self.load_assets
    end

	def load_assets
		@font= Gosu::Font.new(self, FONT_ASSETS[:font], 40)
    end

	def draw
	    @background_image.draw(0,0,0)
	    @x = 250
	    @y= 100
		@image.draw_as_quad(@x, @y, @color, @x + @width, @y, @color,@x + @width, @y + @height, @color, @x, @y + @height, @color,5)

		@font.draw("*" , 200 , @select ,3,1,1 , Gosu::Color::WHITE)

		@font.draw("new game" , 250, 300 ,3,1,1 , Gosu::Color::WHITE)
		@font.draw("credits", 250, 330, 3, 1, 1, Gosu::Color::WHITE)
		@font.draw("quit game", 250, 360, 3, 1, 1, Gosu::Color::WHITE)
	    @font.draw("click space to select", 20, 10, 3, 1, 1, Gosu::Color::WHITE)
	end

	def button_down(button)
		if button == Gosu::KbSpace && @select == 310
			@menuSong.play
			$window.close
			close
       		RXWindow.new.show
    	end

    	if button == Gosu::KbSpace && @select == 370
    		@menuSong.play
    		$window.close
    		close
    	end

    	if button == Gosu::KbDown
    		@menuSong.play
    		if(@select < 370)
				@select += 30 
			end
    	end
    	if button == Gosu::KbUp
    		@menuSong.play
    		if(@select > 310)
				@select -= 30 
			end
    	end
	end
end
