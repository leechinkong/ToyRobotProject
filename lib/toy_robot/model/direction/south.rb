# South direction class.

require 'toy_robot/model/direction/base_direction'

module Direction
  class South < BaseDirection

    # String representation of the direction
    attr_reader:dir

    # Initialize the direction with a string representation
    def initialize
      @dir = S
    end
    
    # Make a left turn from south direction.
    # ====== Returns
    # - the new direction after left turn
    def turnLeft
      return EAST
    end

    # Make a right turn from south direction.
    # ====== Returns
    # - the new direction after right turn
    def turnRight
      return WEST
    end

    # Move vertially forward from current postion facing south.
    # ====== Parameters
    # - +x+:: the current x position
    # - +y+:: the current y position
    # ====== Returns
    # - the new x and y position after move
    def move(x, y)
      return x, y-1
    end

  end
end