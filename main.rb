# Entry point for the game.

require 'Gosu'

class Game < Gosu::Window

	attr_reader :width, :height, :is_fullscreen

	def initialize
		@width = 800
		@height = 600
		@is_fullscreen = false

		super(@width, @height, @is_fullscreen)
	end

	def update
	end

	def draw
	end

end


Game.new.show()