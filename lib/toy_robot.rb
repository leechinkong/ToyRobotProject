# Main module for ToyRobot.
# The main purpose of this module is to serve as an entry point
# to run the Toy Robot Simulator. The logic of running the simulator 
# is encapsulated in RobotController class.

require 'toy_robot/robot_controller'

module ToyRobot

  # Table width (in units), configurable to use any valid width
  WIDTH = 5
  # Table height (in units), configurable to use any valid height
  HEIGHT = 5

  # Run the toy robot simulator.
  # Read and process input commands from file or standard input
  # ====== Parameters
  # - +file+:: the input file containing commands
  def ToyRobot.play(file=nil)
    begin
      # Construct the robotController with table's width and height
      controller = RobotController.new(WIDTH, HEIGHT)
      unless file.nil?
        # Read commands from file
        controller.readCommands(file)
      else
        # Request input commands
        puts "Enter commands to control your toy robot (enter 'QUIT' to stop):"
        controller.requestCommands
      end
    rescue => error
      # Display any error
      puts error
    end
  end

  # Run only when executed directly
  if __FILE__ == $0
    ToyRobot.play(ARGV[0])
  end

end