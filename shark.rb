# Player representation.

require_relative './entity.rb'

class Shark < Entity

	def initialize(game)
		@game = game
		super()

		@direction = 1
		@speed = 1
	end

	def update

		@x += (@speed * @direction)

		# if off screen.
		if @x == -500 then @health = -1 end
		if @x == @game.width + 1000 then @health = -1 end
	end

	def draw
		@game.draw_quad(self.x + 0, 			self.y + 0, 	  	  0xFFFFFFFF,
			                   self.x + self.width, self.y + 0, 	  	  0xFFFFFFFF,
			                   self.x + self.width, self.y + self.height, 0xFFFF0000,
			                   self.x + 0,			self.y + self.height, 0xFFFF0000,
			                   10)
	end

end