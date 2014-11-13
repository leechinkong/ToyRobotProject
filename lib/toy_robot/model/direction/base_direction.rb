# The base class for direction

module Direction
  class BaseDirection

    # Make a left turn from current direction.
    # To be implemented by sub classes.
    # ====== Returns
    # - the new direction after left turn
    def turnLeft
      raise NotImplementedError
    end

    # Make a right turn from current direction.
    # To be implemented by sub classes.
    # ====== Returns
    # - the new direction after right turn
    def turnRight
      raise NotImplementedError
    end

    # Move horizontally forward from current postion facing current direction.
    # To be implemented by sub classes.
    # ====== Parameters
    # - +x+:: the current x position
    # - +y+:: the current y position
    # ====== Returns
    # - the new x and y position after move
    def move(x, y)
      raise NotImplementedError
    end

  end
end
