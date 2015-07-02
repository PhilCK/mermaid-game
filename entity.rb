# Base class.

class Entity

	attr_accessor :x, :y, :width, :height
	attr_reader :health
	attr_reader :name

	def initialize
		@x = @y = 0
		@width = @height = 10
		@health = 1
	end

	def dead?
		return @health <= 0
	end

	def hit
	end

	def update
	end

	def draw
	end

end