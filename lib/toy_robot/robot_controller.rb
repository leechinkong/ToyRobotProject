# Robot controller class.
# To process command, control robot movement and display result.

class RobotController

  # Default table width and height (in units)
  WIDTH = 5
  HEIGHT = 5

  # Process command.
  # = Parameters
  # - +command+:: the command to control robot
  # = Returns
  # - true when command is processed successfully
  def processCommand(command)
    # Check if the command is nil
    if command != nil
      # convert command to all uppercase
      command = command.upcase

      # Check if command is a valid PLACE
      if command =~ /^PLACE\s\d+,\d+,NORTH|EAST|SOUTH|WEST$/
        # Get x and y 
        placement = command.scan(/\d+/)
        x = placement[0].to_i
        y = placement[1].to_i

        # Validate x and y, make sure x and y is within range
        if x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
          # Remember that the robot is placed
          @placed = true
          return true
        end
      # Check if the robot is placed
      elsif @placed == true
        # Check if command is a valid subsequent command
        if command =~ /^MOVE|LEFT|RIGHT$/
          return true
        end
      end
    end

    # Invalid command
    return false
  end

end