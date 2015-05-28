# Entry point for the game.

require 'Gosu'

class Game < Gosu::Window

	def initialize()
		super(800, 600, false)
	end

	def update
	end

	def draw
	end

end


Game.new.show()