require 'gosu'

class Homescreen < Gosu::Window
    FONT_ASSETS = {
      font: "assets/fonts/pixelade-webfont.ttf"
    }

   def initialize
		super 640, 480
		self.caption = "RX Ball"
		@image = Gosu::Image.new("img/logo.png", false)

		#@image = Gosu::Image.from_text self, "RX Ball",Gosu.default_font_name, 100
		@background_image = Gosu::Image.new("img/milky-way-galaxy.jpg", false )
		@height = 150
    	@width = 150
    	@color= Gosu::Color.argb(0xff_ffffff)

    	@select = 310

		self.load_assets
    end
	
	def update
		#@x = self.width  / 2 - @image.width / 2 + Math.sin(Time.now.to_f) * 50
		#@y = self.height / 2 - @image.height / 2 + Math.cos(Time.now.to_f) * 20
	end
	
	def load_assets
		@font= Gosu::Font.new(self, FONT_ASSETS[:font], 40)
    end

	def draw
	    @background_image.draw(0,0,0)
	    @x = 250
	    @y= 100
		@image.draw_as_quad(@x, @y, @color, @x + @width, @y, @color,@x + @width, @y + @height, @color, @x, @y + @height, @color,5)


		#@image.draw_as_quad(@x, @y, @color, @x + @width, @y, @color,@x + @width, @y + @height, @color, @x, @y + @height, @color,5)

		@font.draw("*" , 200 , @select ,3,1,1 , Gosu::Color::WHITE)

		@font.draw("new game" , 250, 300 ,3,1,1 , Gosu::Color::WHITE)
		@font.draw("credits", 250, 330, 3, 1, 1, Gosu::Color::WHITE)
		@font.draw("quit game", 250, 360, 3, 1, 1, Gosu::Color::WHITE)
	    @font.draw("click space to select", 20, 10, 3, 1, 1, Gosu::Color::WHITE)

	end

	def button_down(button)
		if button == Gosu::KbSpace && @select == 310
			$window.close
       		RXWindow.new.show
    	end

    	if button == Gosu::KbSpace && @select == 370
    		$window.close
    		close
    	end

    	if button == Gosu::KbDown
    		if(@select < 370)
				@select += 30 
			end
    	end
    	if button == Gosu::KbUp
    		if(@select > 310)
				@select -= 30 
			end
    	end
	end
end

#Homescreen.new.show