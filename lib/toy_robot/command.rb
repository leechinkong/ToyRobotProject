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
  # Command QUIT
  Q = "QUIT"

  # Validate all commands, case sensitive.
  # ====== Parameters
  # - +command+:: the command to validate
  # ====== Returns
  # the command constant
  def Command.validate(command)
    unless command.nil?
      if command =~ /^#{Command::P}\s\d+,\d+,#{Direction::N}|#{Direction::E}|#{Direction::S}|#{Direction::W}$/
        return Command::P
      else
        return command.scan(/^#{Command::M}|#{Command::L}|#{Command::R}|#{Command::RP}$/)[0]
      end
    end
  end

end