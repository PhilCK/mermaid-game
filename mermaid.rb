# Player representation.

require_relative './entity.rb'

class Mermaid < Entity

	attr_accessor :game

	def initialize(game)
		super()
		@game = game
		@name = :mermaid
	end

	def update

		# movement
		if Gosu::button_down? Gosu::KbRight then
			@x += 10
		end

		if Gosu::button_down? Gosu::KbLeft then
			@x -= 10
		end

		if Gosu::button_down? Gosu::KbUp then
			@y -= 10
		end

		if Gosu::button_down? Gosu::KbDown then
			@y += 10
		end

		# keep in bounds of screen.
		if(@x < 0) then @x = 0 end
		if(@y < 0) then @y = 0 end
		if(@x + @width > @game.width) then @x = @game.width - @width end
		if(@y + @height > @game.height) then @y = @game.height - @height end
	end

	def draw
		game.draw_quad(self.x + 0, 			self.y + 0, 	  	  0xFFFFFFFF,
	                   self.x + self.width, self.y + 0, 	  	  0xFFFFFFFF,
	                   self.x + self.width, self.y + self.height, 0xFFFFFFFF,
	                   self.x + 0,			self.y + self.height, 0xFFFFFFFF,
	                   0)
	end

end