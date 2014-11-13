# Robot controller class.
# The serves as the Controller class of the MVC design pattern. 
# This class is for processing commands, control robot movement
# and display results.

require 'toy_robot/model/direction'
require 'toy_robot/model/robot'
require 'toy_robot/model/table'
require 'toy_robot/robot_view'
require 'toy_robot/command'

class RobotController
  include Direction, Command

  # The view object to capture input and display output
  attr_accessor:view

  # Initialize table controller.
  # ====== Parameters
  # - +width+:: the width of the table
  # - +height+:: the height of the table
  def initialize(width, height)
    @table = Table.new(width, height)
    @view = RobotView.new
  end

  # Process command.
  # ====== Parameters
  # - +command+:: the command to control robot
  # ====== Returns
  # - true when command is processed successfully
  def processCommand(command)
    # Check if the command is nil
    unless command.nil?
      # Convert command to all uppercase
      command = command.upcase
      # Find out the type of command, PLACE, LEFT, RIGHT, MOVE or REPORT
      commandConst = Command.validate(command)
      # Only process non-PLACE command when robot is placed
      unless commandConst != Command::P && @robot.nil?
        case commandConst
        when Command::P
          # Get x and y 
          position = command.scan(/\d+/)
          x = position[0].to_i
          y = position[1].to_i
          # Validate x and y, make sure x and y is within range
          if @table.validate(x, y)
            # Get face, expect only one value to be returned
            face = command.scan(/#{Direction::N}|#{Direction::E}|#{Direction::S}|#{Direction::W}$/)[0]
            # Create a Robot instance, if not already created
            if @robot.nil?
              @robot = Robot.new(x, y, face)
            else
              @robot.update(x, y, face)
            end
            return true
          end
        when Command::L
          @robot.updateFace(Direction.turnLeft(@robot.face))
          return true
        when Command::R
          @robot.updateFace(Direction.turnRight(@robot.face))
          return true
        when Command::M
          x, y = Direction.move(@robot.x, @robot.y, @robot.face)
          # Make sure the robot does not fall off the table
          if @table.validate(x, y)
            @robot.updatePosition(x, y)
            return true
          end
        when Command::RP 
          @view.displayOutput(@robot.x, @robot.y, @robot.face)
          return true
        end
      end
    end
    # Invalid command
    return false
  end

  # Read commands from file.
  # ====== Parameters
  # - +file+:: the input file containing commands to process
  def readCommands(file)
    unless file.nil?
      # Read from file
      begin
        file = File.new(file, "r")
        while (line = file.gets)
          unless line.nil?
            processCommand(line.chomp)
          end
        end
        file.close
      rescue => error
        raise IOError, "Failed to read input file: #{error}"
      end
    end
  end

  # Request input commands from view, until QUIT is detected.
  def requestCommands
    # Request input in a loop until QUIT is read
    quit = false
    until quit do
      input = @view.captureInput
      # Check if input is QUIT
      quit = input =~ /^#{Command::Q}$/i
      unless quit
        processCommand(input)
      end
    end
  end
end