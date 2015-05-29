# Creates the entities and ending conditions for the game.

require_relative './mermaid.rb'
require_relative './treasure.rb'

class MainGameMode

	attr_accessor :entities;

	def initialize(game, number_of_players)
		@entities = []

		if(number_of_players == 1)
			@entities << Mermaid.new(game);
		else
			@entities << Mermaid.new(game);
			@entities << Mermaid.new(game);
		end

		@entities << Treasure.new(game)
	end


	def update
		@entities.each do |e|
			e.update()
		end
	end


	def draw
		@entities.each do |e|
			e.draw()
		end
	end

end