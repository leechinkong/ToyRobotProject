# North direction class.

require 'toy_robot/model/direction/base_direction'

module Direction
  class North < BaseDirection

    # Make a left turn from north direction.
    # ====== Returns
    # - the new direction after left turn
    def turnLeft
      return WEST
    end

    # Make a right turn from north direction.
    # ====== Returns
    # - the new direction after right turn
    def turnRight
      return EAST
    end

    # Move vertially forward from current postion facing north.
    # ====== Parameters
    # - +x+:: the current x position
    # - +y+:: the current y position
    # ====== Returns
    # - the new x and y position after move
    def move(x, y)
      return x, y+1
    end

  end
end