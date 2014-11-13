# Direction module.

require 'toy_robot/model/direction/north'
require 'toy_robot/model/direction/east'
require 'toy_robot/model/direction/south'
require 'toy_robot/model/direction/west'

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
  
end