# Robot controller class.
# The serves as the Controller class of the MVC design pattern. 
# This class is for processing commands, control robot movement
# and display results.

require 'toy_robot/direction'
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
      # convert command to all uppercase
      command = command.upcase

      # Check if command is a valid PLACE
      if Command.validatePlace(command)
        # Get x and y 
        placement = command.scan(/\d+/)
        x = placement[0].to_i
        y = placement[1].to_i

        # Validate x and y, make sure x and y is within range
        if @table.validate(x, y)
          # Get face, expect only one value to be returned
          face = command.scan(/#{Direction::N}|#{Direction::E}|#{Direction::S}|#{Direction::W}$/)[0]
          # Create a Robot instance, if not already created
          if @robot.nil?
            @robot = Robot.new(x, y, face)
          else
            @robot.x = x
            @robot.y = y
            @robot.face = face
          end
          return true
        end
      # Check if the robot is placed
      elsif @robot != nil
        # Check if command is a valid subsequent command
        if Command.validate(command)
          if command == "#{Command::L}"
            @robot.face = Direction.turnLeft(@robot.face)
            return true
          elsif command == "#{Command::R}"
            @robot.face = Direction.turnRight(@robot.face)
            return true
          elsif command == "#{Command::M}"
            x, y = Direction.move(@robot.x, @robot.y, @robot.face)
            # Make sure the robot does not fall off the table
            if @table.validate(x, y)
              @robot.x = x
              @robot.y = y
              return true
            end
          elsif command == "#{Command::RP}"
            @view.displayOutput(@robot.x, @robot.y, @robot.face)
            return true
          end
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