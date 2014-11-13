# Command module.
# Helper module for RobotController class, where command constants 
# and helper methods are defined.

module Command

  # Command PLACE
  P = "PLACE"
  # Command MOVE
  M = "MOVE"
  # Command LEFT
  L = "LEFT"
  # Command RIGHT
  R = "RIGHT"
  # Command REPORT
  RP = "REPORT"

  # Validate PLACE command, case sensitive.
  # = Parameters
  # - +command+:: the command to validate
  def Command.validatePlace(command)
    if command =~ /^#{Command::P}\s\d+,\d+,#{Direction::N}|#{Direction::E}|#{Direction::S}|#{Direction::W}$/
      return true
    end
    return false
  end

  # Validate other command, case sensitive.
  # = Parameters
  # - +command+:: the command to validate
  def Command.validate(command)
    if command =~ /^#{Command::M}|#{Command::L}|#{Command::R}|#{Command::RP}$/
      return true
    end
    return false
  end

end