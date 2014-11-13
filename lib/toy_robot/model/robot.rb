# Robot class

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
  def initialize(x, y, face)
    update(x, y, face)
  end

  # Update the robot with x and y position and direction the robot is facing.
  # ====== Parameters
  # - +x+:: the x position on the table
  # - +y+:: the y position on the table
  # - +face+:: the direction the robot is facing
  def update(x, y, face)
    updatePosition(x, y)
    updateFace(face)
  end

  # Update the robot with x and y position
  # ====== Parameters
  # - +x+:: the x position on the table
  # - +y+:: the y position on the table
  def updatePosition(x, y)
    # raise error for invalid arguments
    raise ArgumentError, 'Robot x position is invalid.' unless x.is_a?(Numeric)
    raise ArgumentError, 'Robot y position is invalid.' unless y.is_a?(Numeric)

    @x = x
    @y = y
  end


  # Update the direction the robot is facing.
  # ====== Parameters
  # - +face+:: the direction the robot is facing
  def updateFace(face)
    # raise error for invalid arguments
    raise ArgumentError, 'The direction where the robot is facing is not provided.' if face.nil?

    @face = face
  end

end