# Creates the entities and ending conditions for the game.

require_relative './mermaid.rb'
require_relative './treasure.rb'
require_relative './shark.rb'

NUMBER_OF_SHARKS = 5

class MainGameMode

	attr_accessor :entities;

	def initialize(game, number_of_players)
		@game = game
		@entities = []

		if(number_of_players == 1)
			@entities << Mermaid.new(game);
		elsif(number_of_players == 2)
			@entities << Mermaid.new(game);
			@entities << Mermaid.new(game);
		end

		@entities << Treasure.new(game)

		NUMBER_OF_SHARKS.times do
			@entities << Shark.new(game)
		end
	end


	def update

		# Clean up
		old_entities = @entities
		@entities = []
		removed_sharks = 0

		old_entities.each do |e|
			unless e.dead?
				@entities << e
			else
				if(e.name == :shark)
					removed_sharks += 1
				end
			end
		end

		# Add removed sharks
		removed_sharks.times do
			@entities << Shark.new(@game)
		end


		# update entities
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