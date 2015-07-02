# Boat for treasure

require_relative './entity.rb'

class Ship < Entity

  attr_accessor :game

  def initialize(game)
    super()

    @game = game
    @width = 100
    @height = 90
    @x = 200

  end


  def update
    
  end


  def draw
    game.draw_quad(self.x + 0,      self.y + 0,         0xFFFFFFFF,
                     self.x + self.width, self.y + 0,         0xFFFFFFFF,
                     self.x + self.width, self.y + self.height, 0xFFFFFFFF,
                     self.x + 0,      self.y + self.height, 0xFFFFFFFF,
                     0)
  end


end