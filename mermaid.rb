
class Mermaid

	attr_reader :x, :y, :width, :height
	attr_accessor :game

	def initialize(game)
		@x = @y = 0
		@width = @height = 10
		@game = game
	end

	def update

	end

	def draw
		game.draw_quad(0, 0, 0xFFFFFFFF,
                   10, 0, 0xFFFFFFFF,
                   0, 10, 0xFFFFFFFF,
                   10, 10, 0xFFFFFFFF,
                   0)
	end

end