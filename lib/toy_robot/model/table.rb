# Table class

class Table

  # The width of the table
  attr_reader:width
  # The height of the table
  attr_reader:height

  # Initialize the table with width and height (in units).
  # = Parameters
  # - +width+:: the width of the table
  # - +height+:: the height of the table
  def initialize(width, height)
    @width = width
    @height = height
  end

  # Validate x and y position to make sure the robot does not fall off the table.
  # = Parameters
  # - +x+:: the x position of the robot
  # - +y+:: the y position of the robot
  # = Returns
  # - true when x and y is valid
  def validate(x, y)
    return x >= 0 && x < @width && y >= 0 && y < @height
  end

end