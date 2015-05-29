
require_realative './entity.rb'

class Treasure < Entity

	def initialize(game)
		@game = game
		self.width = 100
		self.height = 80

		self.x = self.y = 200
	end


	def update
		
	end


	def draw
		game.draw_quad(self.x + 0, 			self.y + 0, 	  	  0xFFFFFF00,
	                   self.x + self.width, self.y + 0, 	  	  0xFFFFFF00,
	                   self.x + self.width, self.y + self.height, 0xFFFFFF00,
	                   self.x + 0,			self.y + self.height, 0xFFFFFF00,
	                   10)		
	end

end