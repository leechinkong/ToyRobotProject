# Robot view class.
# The purpose of this class is to capture input and display output as is.
# This class serves as the View of MVC design pattern. 
# It does not include any logic to manipulate the data.
# It can be replaced with a UI at a later stage, with no changes
# to the Controller or Model classes.

class RobotView

  # Display input parameters as is to stdout.
  # No validataion of the parameters are needed.
  # = Parameters
  # - +x+:: the x value
  # - +y+:: the y value
  # - +face+:: the face value
  def displayOutput(x, y, face)
    raise ArgumentError, 'Robot x position is not provided.' unless (x != nil)
    raise ArgumentError, 'Robot y position is not provided.' unless (y != nil)
    raise ArgumentError, 'Robot face is not provided.' unless (face != nil)

    # Display output as green
    puts "\e[#{32}m#{x},#{y},#{face}\e[0m"
  end

  # Capture input in stdin.
  # = Returns
  # - Return a line captured from stdin to caller.
  def captureInput
    return gets.chomp
  end

end