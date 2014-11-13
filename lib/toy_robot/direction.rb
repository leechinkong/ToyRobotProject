# Direction module.
# Helper module for RobotController class, where direction constants 
# and helper methods are defined.

module Direction

  # Direction NORTH
  N = "NORTH"
  # Direction EAST
  E = "EAST"
  # Direction SOUTH
  S = "SOUTH"
  # Direction WEST
  W = "WEST"

  # Make a left turn from current direction.
  # ====== Parameters
  # - +dir+:: the current direction
  # ====== Returns
  # - the new direction after left turn
  def Direction.turnLeft(dir)
    if dir == N
      newDir = W
    elsif dir == E
      newDir = N
    elsif dir == S
      newDir = E
    elsif dir == W
      newDir = S
    else
      newDir = dir
    end
    return newDir
  end

  # Make a right turn from current direction.
  # ====== Parameters
  # - +dir+:: the current direction
  # ====== Returns
  # - the new direction after right turn
  def Direction.turnRight(dir)
    if dir == N
      newDir = E
    elsif dir == E
      newDir = S
    elsif dir == S
      newDir = W
    elsif dir == W
      newDir = N
    else
      newDir = dir
    end
    return newDir
  end

  # Move forward from current postion.
  # The move could be vertially or horizontally depending on the current direction.
  # ====== Parameters
  # - +x+:: the current x position
  # - +y+:: the current y position
  # - +dir+:: the current direction
  # ====== Returns
  # - the new x and y position after move
  def Direction.move(x, y, dir)
    if dir == N
      y += 1
    elsif dir == E
      x += 1
    elsif dir == S
      y -= 1
    elsif dir == W
      x -= 1
    end
    return x, y
  end

end