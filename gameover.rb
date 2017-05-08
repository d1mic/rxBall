require 'gosu'

class GameOver < Gosu::Window
    FONT_ASSETS = {
      font: "assets/fonts/pixelade-webfont.ttf"
    }

   def initialize
		super 640, 480
		self.caption = "RX Ball"
		@background_image = Gosu::Image.new("img/game-over.png", false)
		self.load_assets
	end
	
	def update	
	end
	
	def load_assets
		@font= Gosu::Font.new(self, FONT_ASSETS[:font], 40)
    end
	
	def draw
	    @background_image.draw(0,0, 1, 0.65, 0.65)
	   	@font.draw("press any key to start the game", 100, 400, 3, 1, 1, Gosu::Color::YELLOW)
	    @font.draw("esc to exit", 20, 10, 3, 1, 1, Gosu::Color::YELLOW)	
	end
	
	def button_down(button)
		close if button == Gosu::KbEscape
	end
end 

GameOver.new.show
