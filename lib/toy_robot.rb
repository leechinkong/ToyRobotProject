# Main class for ToyRobot

require 'toy_robot/robot_controller'

module ToyRobot

  WIDTH = 5
  HEIGHT = 5

  # Run toy robot.
  # = Parameters
  # - +file+:: the input file containing commands
  def ToyRobot.play(file=nil)
    begin
      controller = RobotController.new(WIDTH, HEIGHT)
      unless file.nil?
        controller.readFromFile(file)
      else
        puts "Enter command to control your toy robot (enter 'QUIT' to stop):"
        controller.readFromStdin
      end
    rescue => error
      puts error
    end
  end

  # Run only when executed directly
  if __FILE__ == $0
    ToyRobot.play(ARGV[0])
  end

end