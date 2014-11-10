# Robot class

class Robot

  # The x position on the table
  attr_accessor:x
  # The y position on the table
  attr_accessor:y
  # The direction the robot is facing
  attr_accessor:face

  # Initialize the robot with x and y position and direction facing.
  def initialize(x, y, face)
    @x = x
    @y = y
    @face = face
  end

end