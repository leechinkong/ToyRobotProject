# Robot class

class Robot

  # The x position on the table
  attr_accessor:x
  # The y position on the table
  attr_accessor:y
  # The direction the robot is facing
  attr_accessor:face

  # Initialize the robot with x and y position and direction the robos is facing.
  # = Parameters
  # - +x+:: the x position on the table
  # - +y+:: the y position on the table
  # - +face+:: the direction the robot is facing
  def initialize(x, y, face)
    # raise error for invalid arguments
    raise ArgumentError, 'Robot x position is invalid.' unless x.is_a?(Numeric)
    raise ArgumentError, 'Robot y position is invalid.' unless y.is_a?(Numeric)

    @x = x
    @y = y
    @face = face
  end

end