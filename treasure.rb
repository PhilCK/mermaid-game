
require_relative './entity.rb'

class Treasure < Entity

	def initialize(game)
		@game = game
		super()

		@width = 100
		@height = 60
		@x = 100
		@y = 400

		@name = :treasure
	end


	def update
	end


	def draw
		@game.draw_quad(self.x + 0, 			self.y + 0, 	  	  0xFFFFFFFF,
	                   self.x + self.width, self.y + 0, 	  	  0xFFFFFFFF,
	                   self.x + self.width, self.y + self.height, 0xFFFFFFFF,
	                   self.x + 0,			self.y + self.height, 0xFFFFFFFF,
	                   0)		
	end

end