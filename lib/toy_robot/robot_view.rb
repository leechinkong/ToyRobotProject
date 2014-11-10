# Robot view class

class RobotView

  # Display input parameters as is to stdout.
  # No validataion of the parameters are needed.
  # = Parameters
  # - +x+:: the x value
  # - +y+:: the y value
  # - +face+:: the face value
  def displayOutput(x, y, face)
    puts "#{x},#{y},#{face}"
  end

end