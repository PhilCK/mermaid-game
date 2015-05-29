# Entry point.
# Holds current game state.

require 'Gosu'
require_relative './game_mode'

class Game < Gosu::Window

	attr_reader :width, :height, :is_fullscreen
	attr_accessor :game_state

	def initialize
		@width = 800
		@height = 600
		@is_fullscreen = false

		super(@width, @height, @is_fullscreen)
		self.caption = "Mermaids"

		@game_state = MainGameMode.new(self, 1)
	end

	def update
		@game_state.update()
	end

	def draw
		@game_state.draw();
	end

end


Game.new.show()