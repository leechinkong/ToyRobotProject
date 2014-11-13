# West direction class.

require 'toy_robot/model/direction/base_direction'

module Direction
  class West < BaseDirection

    # Make a left turn from west direction.
    # ====== Returns
    # - the new direction after left turn
    def turnLeft
      return NORTH
    end

    # Make a right turn from west direction.
    # ====== Returns
    # - the new direction after right turn
    def turnRight
      return SOUTH
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