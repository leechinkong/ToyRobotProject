# Robot controller class.
# The serves as the Controller class of the MVC design pattern. 
# This class is for processing commands, control robot movement
# and display results.

require 'toy_robot/model/direction/direction'
require 'toy_robot/model/robot'
require 'toy_robot/model/table'
require 'toy_robot/robot_view'
require 'toy_robot/command'

class RobotController
  include Direction, Command

  # The view object to capture input and display output
  attr_accessor:view
  # The robot object
  attr_reader:robot

  # Initialize table controller.
  # ====== Parameters
  # - +width+:: the width of the table
  # - +height+:: the height of the table
  def initialize(width, height)
    @table = Table.new(width, height)
    @view = RobotView.new
    @robot = Robot.new(@table)
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
      unless commandConst.nil? || (commandConst != Command::P && !@robot.placed)
        case commandConst
        when Command::P
          # Get x and y 
          position = command.scan(/\d+/)
          x = position[0].to_i
          y = position[1].to_i
          face = command.scan(/#{Direction::N}|#{Direction::E}|#{Direction::S}|#{Direction::W}$/)[0]
          @robot.update(x, y, face)
        when Command::L
          @robot.turnLeft
        when Command::R
          @robot.turnRight
        when Command::M
          @robot.move
        when Command::RP 
          @view.displayOutput(@robot.x, @robot.y, @robot.face)
        end
        return true
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