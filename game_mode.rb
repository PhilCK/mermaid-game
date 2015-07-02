# Creates the entities and ending conditions for the game.

require_relative './mermaid.rb'
require_relative './treasure.rb'
require_relative './shark.rb'
require_relative './ship.rb'

NUMBER_OF_SHARKS = 5


class AABB

	attr_reader :tlx, :tly, :brx, :bry

	def initialize(top_left_x, top_left_y, bot_right_x, bot_right_y)
		@tlx = top_left_x
		@tly = top_left_y

		@brx = bot_right_x
		@bry = bot_right_y
	end

	def contains?(other)
		#are x's between other x's
		if((self.tlx < other.tlx && self.tlx > other.brx) || (self.brx > other.tlx && self.brx < other.brx))
			if((self.tly < other.tly && self.tly > other.bry) || (self.bry > other.tly && self.bry < other.bry))
				return true
			end
		end


		return false

	end

end


class MainGameMode

	attr_accessor :entities
	attr_reader :player_one, :player_two, :players

	def initialize(game, number_of_players)

		@game 		= game
		@entities 	= []

		if(number_of_players == 1)
			@player_one = Mermaid.new(game)
			@entities << @player_one
			@players = [@player_one]
		elsif(number_of_players == 2)
			@player_one = Mermaid.new(game)
			@entities << @player_one
			@player_two = Mermaid.new(game)
			@entities << @player_two

			@players = [@player_one, @player_two]
		end

		@entities << Ship.new(game)
		@entities << Treasure.new(game)

		NUMBER_OF_SHARKS.times do
			@entities << Shark.new(game)
		end
	end

	def update


		# Test for collisions
		@players.each do |player|

			player_aabb = AABB.new(player.x, player.y, player.x + player.width, player.y + player.height)

			@entities.each do |e|

				# Take Damage
				if e.name == :shark

					shark_aabb = AABB.new(e.x, e.y, e.x + e.width, e.y + e.height)

					if(player_aabb.contains?(shark_aabb))
						puts "collided with shark"
					end

				end

				# Pickup treasure
				if e.name == :treasure

					chest_aabb = AABB.new(e.x, e.y, e.x + e.width, e.y + e.height)

					if(player_aabb.contains?(chest_aabb))
						puts "chest collision"

						if(player.holding_obj == nil)
							puts "pickingup chest"
							player.holding_obj = e;
						end
					end

				end

			end

		end



		# Clean up
		old_entities 	= @entities
		@entities 		= []
		removed_sharks 	= 0

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