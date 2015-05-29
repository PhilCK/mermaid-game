# Player representation.

require_relative './entity.rb'

class Shark < Entity

	def initialize(game)
		@game = game
		super()

		@name = :shark


		@width = 100
		@height = 20

		@y = rand(game.height() * 0.66) + (game.height() * 0.33) - @height
		@x = -width + (rand(2) * (game.width + @width))

		if @x > 0 then @direction = -1 else @direction = 1 end
		@speed = (rand(10) + 10) / 20.0
	end

	def update

		@x += (@speed * @direction)

		# if off screen.
		if @x < -(@width + 10) then @health = -1 end
		if @x > @game.width + @width + 10 then @health = -1 end
	end

	def draw
		@game.draw_quad(self.x + 0, 		 self.y + 0, 	  	   0xFFFFFFFF,
	                    self.x + self.width, self.y + 0, 	  	   0xFFFFFFFF,
	                    self.x + self.width, self.y + self.height, 0xFFFF0000,
	                    self.x + 0,			 self.y + self.height, 0xFFFF0000,
	                    10)
	end

end