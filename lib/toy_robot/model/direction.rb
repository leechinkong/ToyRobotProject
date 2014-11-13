# Direction module.
# Helper module for RobotController class, where direction constants 
# and helper methods are defined.
require 'toy_robot/model/north'
require 'toy_robot/model/east'
require 'toy_robot/model/south'
require 'toy_robot/model/west'

module Direction

  # Direction NORTH string
  N = "NORTH"
  # Direction EAST string
  E = "EAST"
  # Direction SOUTH string
  S = "SOUTH"
  # Direction WEST string
  W = "WEST"

  # Direction NORTH object
  NORTH = North.new
  # Direction EAST object
  EAST = East.new
  # Direction SOUTH object
  SOUTH = South.new
  # Direction WEST object
  WEST = West.new

  # Return a direction object according the direction string.
  # ====== Parameters
  # - +dir+:: the direction string
  # ====== Returns
  # - a direction object of the direction string
  def Direction.toDirection(dir)
    case dir
    when N
      return NORTH
    when E
      return EAST
    when S
      return SOUTH
    when W
      return WEST
    end
  end

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