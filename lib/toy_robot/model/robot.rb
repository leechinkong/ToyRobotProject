# Robot class

require 'toy_robot/model/direction/direction'

class Robot

  # The x position on the table
  attr_reader:x
  # The y position on the table
  attr_reader:y
  # The direction the robot is facing
  attr_reader:face

  # Initialize the robot with x and y position and direction the robot is facing.
  # ====== Parameters
  # - +x+:: the x position on the table
  # - +y+:: the y position on the table
  # - +face+:: the direction the robot is facing
  def initialize(x, y, face, table)
    update(x, y, face)
    @table = table
  end

  # Update the robot with x and y position and direction the robot is facing.
  # ====== Parameters
  # - +x+:: the x position on the table
  # - +y+:: the y position on the table
  # - +face+:: the direction the robot is facing
  def update(x, y, face)
    # raise error for invalid arguments
    raise ArgumentError, 'Robot x position is invalid.' unless x.is_a?(Numeric)
    raise ArgumentError, 'Robot y position is invalid.' unless y.is_a?(Numeric)
    raise ArgumentError, 'The direction where the robot is facing is not provided.' if face.nil?
 
    @x = x
    @y = y
    @face = Direction.toDirection(face)
  end

  # Update to the left direction the robot is facing
  def turnLeft
    @face = face.turnLeft
  end

  # Update to the right direction the robot is facing
  def turnRight
    @face = face.turnRight
  end

  # Update the position the robot based on the current direction.
  def move
    position = face.move(@x, @y)
    x = position[0]
    y = position[1]
    if @table.validate(x, y)
      @x = x
      @y = y
    end
  end

end