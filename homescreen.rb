require 'gosu'

class Homescreen < Gosu::Window
    FONT_ASSETS = {
      font: "assets/fonts/pixelade-webfont.ttf"
    }

   def initialize
		super 640, 480
		self.caption = "RX Ball"
		@image = Gosu::Image.from_text self, "RX Ball",
											Gosu.default_font_name, 100
		@background_image = Gosu::Image.new("img/milky-way-galaxy.jpg", false)
		self.load_assets
    end
	
	def update
		@x = self.width / 2 - @image.width / 2 + Math.sin(Time.now.to_f) * 100
		@y = self.height / 2 - @image.height / 2 + Math.cos(Time.now.to_f) * 100
	end
	
	def load_assets
		@font= Gosu::Font.new(self, FONT_ASSETS[:font], 40)
    end

	def draw
	    @background_image.draw(0,0,0)
		@image.draw @x, @y, 0
	    @font.draw("esc to exit", 20, 10, 3, 1, 1, Gosu::Color::WHITE)
	    @font.draw("press any key to start the game", 100, 400, 3, 1, 1, Gosu::Color::WHITE)
	end

	def button_down(button)
		close if button == Gosu::KbEscape
	end
end

Homescreen.new.show
