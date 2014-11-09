# Robot controller class.
# To process command, control robot movement and display result.

class RobotController

  # Process command
  def processCommand(command)
    if command =~ /^PLACE\s\d+,\d+,NORTH|EAST|SOUTH|WEST$/
      return true
    end
    return false
  end
end