# West direction class.

require 'toy_robot/model/direction/base_direction'

module Direction
  class West < BaseDirection

    # String representation of the direction
    attr_reader:dir

    # Initialize the direction with a string representation
    def initialize
      @dir = W
    end
    
    # Make a left turn from west direction.
    # ====== Returns
    # - the new direction after left turn
    def turnLeft
      return SOUTH
    end

    # Make a right turn from west direction.
    # ====== Returns
    # - the new direction after right turn
    def turnRight
      return NORTH
    end

    # Move horizontally forward from current postion facing west.
    # ====== Parameters
    # - +x+:: the current x position
    # - +y+:: the current y position
    # ====== Returns
    # - the new x and y position after move
    def move(x, y)
      return x-1, y
    end

  end
end