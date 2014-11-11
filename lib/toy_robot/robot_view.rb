# Robot view class

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
    puts "  #{x},#{y},#{face}"
  end

  # Capture input in stdin.
  # = Returns
  # - Return a line captured from stdin to caller.
  def captureInput
    return gets.chomp
  end
end