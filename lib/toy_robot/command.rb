# Command module.
# To store command constants and validate commands.

module Command

  P = "PLACE"
  M = "MOVE"
  L = "LEFT"
  R = "RIGHT"
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