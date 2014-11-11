require 'spec_helper'

# Tests for RobotController
describe RobotController do

  # Create a new instance for each test
  before :each do
    @controller = RobotController.new(5, 5)
  end

  # Test initialize
  describe "#new" do
    it "is an instance of RobotController" do
      expect(@controller).to be_an_instance_of(RobotController)
    end
  end

  # Test processCommand
  describe "#processCommand" do
    it "when command is nil" do
      expect(@controller.processCommand(nil)).to eq(false)
    end

    it "when command is not the expected first command" do
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
      expect(@controller.processCommand("#{Command::L}")).to eq(false)
      expect(@controller.processCommand("#{Command::R}")).to eq(false)
      expect(@controller.processCommand("#{Command::RP}")).to eq(false)
    end

    it "when command is a valid first command" do
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
    end

    it "when command is an invalid subsequent command" do
      # Place the robot on the table first
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Test if subsequent invalid commands failed
      expect(@controller.processCommand(nil)).to eq(false)
      expect(@controller.processCommand("UNKNOWN")).to eq(false)
    end

    it "when command is a valid subsequent command" do
      # Place the robot on the table first
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Test if subsequent valid commands are successful
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      expect(@controller.processCommand("#{Command::RP}")).to eq(true)
    end

    it "when command is mixed or lowercases" do
      # Place the robot on the table first
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Test if subsequent valid commands are successful
      expect(@controller.processCommand("place 0,0,#{Direction::N}")).to eq(true)
      expect(@controller.processCommand("mOvE")).to eq(true)
      expect(@controller.processCommand("leFt")).to eq(true)
      expect(@controller.processCommand("Right")).to eq(true)
      expect(@controller.processCommand("report")).to eq(true)
    end

    it "when PLACE command has invalid x and y" do
      # Test when x and y is greater than the table dimension
      expect(@controller.processCommand("#{Command::P} 5,5,#{Direction::N}")).to eq(false) 
      # Test when x and y is nagative value     
      expect(@controller.processCommand("#{Command::P} -1,-1,#{Direction::N}")).to eq(false)     
    end

    it "when PLACE command has valid x and y" do
      expect(@controller.processCommand("#{Command::P} 0,4,#{Direction::N}")).to eq(true)     
      expect(@controller.processCommand("#{Command::P} 4,0,#{Direction::N}")).to eq(true)  
      expect(@controller.processCommand("#{Command::P} 2,2,#{Direction::N}")).to eq(true)     
      expect(@controller.processCommand("#{Command::P} 4,4,#{Direction::N}")).to eq(true)     
    end

    it "when robot is at NORTH-EAST edge and MOVE command is invalid" do
      # Place the robot at the NORTH-EAST edge of the table first
      expect(@controller.processCommand("#{Command::P} 4,4,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the NORTH edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
      # Turn the robot to face EAST
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the EAST edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
    end

    it "when robot is at NORTH-WEST edge and MOVE command is invalid" do
      # Place the robot at the NORTH-WEST edge of the table first
      expect(@controller.processCommand("#{Command::P} 0,4,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the NORTH edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
      # Turn the robot to face WEST
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the WEST edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
    end

    it "when robot is at SOUTH-WEST edge and MOVE command is invalid" do
      # Place the robot at the SOUTH-WEST edge of the table
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the WEST edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
      # Turn the robot to face SOUTH
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the SOUTH edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
    end

    it "when robot is at SOUTH-EAST edge and MOVE command is invalid" do
      # Place the robot at the SOUTH-EAST edge of the table
      expect(@controller.processCommand("#{Command::P} 4,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the EAST edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
      # Turn the robot to face SOUTH
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the SOUTH edge
      expect(@controller.processCommand("#{Command::M}")).to eq(false)
    end

    it "when robot is at NORTH-EAST edge and MOVE command is valid" do
      # Place the robot at the NORTH-EAST edge of the table first
      expect(@controller.processCommand("#{Command::P} 4,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards WEST
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
      # Place the robot back at the NORTH-EAST edge of the table
      expect(@controller.processCommand("#{Command::P} 4,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST then SOUTH
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards SOUTH
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
    end

    it "when robot is at NORTH-WEST edge and MOVE command is valid" do
      # Place the robot at the NORTH-WEST edge of the table first
      expect(@controller.processCommand("#{Command::P} 0,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards EAST
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
      # Place the robot back at the NORTH-WEST edge of the table
      expect(@controller.processCommand("#{Command::P} 0,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST then SOUTH
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards SOUTH
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
    end

    it "when robot is at SOUTH-WEST edge and MOVE command is valid" do
      # Place the robot at the SOUTH-WEST edge of the table
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards NORTH
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
      # Place the robot back at the SOUTH-WEST edge of the table
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST
      expect(@controller.processCommand("#{Command::R}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards EAST
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
    end

    it "when robot is at SOUTH-EAST edge and MOVE command is valid" do
      # Place the robot at the SOUTH-EAST edge of the table
      expect(@controller.processCommand("#{Command::P} 4,0,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards NORTH
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
      # Place the robot back at the SOUTH-EAST edge of the table
      expect(@controller.processCommand("#{Command::P} 4,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST
      expect(@controller.processCommand("#{Command::L}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards WEST
      expect(@controller.processCommand("#{Command::M}")).to eq(true)
    end

    it "when REPORT is valid" do
      # Place the robot at the NORTH-EAST edge of the table
      expect(@controller.processCommand("#{Command::P} 0,0,#{Direction::N}")).to eq(true)
      # Test when subsequent REPORT command resulted in RobotView.displayOutput to be called
      expect(@controller.view).to receive(:displayOutput).with(0, 0, Direction::N)
      expect(@controller.processCommand("#{Command::RP}")).to eq(true)
    end
  end

    # Test readCommands
  describe "#readCommands" do
    it "when file is nil" do
      # Command to write to stdin
      command = "#{Command::P} 0,0,#{Direction::N}"
      # Expect RobotView.captureInput to be called to read command from stdin
      mockView = RobotView.new
      expect(mockView).to receive(:captureInput).and_return(command, "QUIT")
      # Expect RobotController.processCommand to be called to process command
      @controller.view = mockView
      expect(@controller).to receive(:processCommand).with(command).exactly(1).times
      @controller.readCommands(nil)
    end
    it "when PLACE, MOVE, REPORT are called" do
      # Commands to write to stdin
      place = "#{Command::P} 0,0,#{Direction::N}"
      move = "#{Command::M}"
      report = "#{Command::RP}"
      # Expect RobotView.captureInput to be called to read command from stdin
      mockView = RobotView.new
      expect(mockView).to receive(:captureInput).and_return(place, move, report, "QUIT")
      # Expect RobotController.processCommand to be called to process command
      @controller.view = mockView
      expect(@controller).to receive(:processCommand).with(place).exactly(1).times
      expect(@controller).to receive(:processCommand).with(move).exactly(1).times
      expect(@controller).to receive(:processCommand).with(report).exactly(1).times
      @controller.readCommands(nil)
    end
    it "when PLACE, LEFT, RIGHT, MOVE, REPORT are called" do
      # Commands to write to stdin
      place = "#{Command::P} 0,0,#{Direction::N}"
      left = "#{Command::L}"
      right = "#{Command::R}"
      move = "#{Command::M}"
      report = "#{Command::RP}"
      # Expect RobotView.captureInput to be called to read command from stdin
      mockView = RobotView.new
      expect(mockView).to receive(:captureInput).and_return(place, left, right, move, report, "QUIT")
      # Expect RobotController.processCommand to be called to process command
      @controller.view = mockView
      expect(@controller).to receive(:processCommand).with(place).exactly(1).times
      expect(@controller).to receive(:processCommand).with(left).exactly(1).times
      expect(@controller).to receive(:processCommand).with(right).exactly(1).times
      expect(@controller).to receive(:processCommand).with(move).exactly(1).times
      expect(@controller).to receive(:processCommand).with(report).exactly(1).times
      @controller.readCommands(nil)
    end
    it "when file is not found" do
      expect{@controller.readCommands("unknown file")}.to raise_error(IOError)
    end
    it "when file is valid" do
      @controller.readCommands(File.join(File.dirname(__FILE__), "/data/test_data.txt"))
      expect(@controller.view).to receive(:displayOutput).with(2, 2, Direction::S)
      expect(@controller.processCommand("#{Command::RP}")).to eq(true)
    end
    it "verify results against result file" do
      # read results file
      begin
        file = File.new(File.join(File.dirname(__FILE__), "/data/test_result.txt"), "r")
        while (line = file.gets)
          unless line.nil?
            if line =~ /^REPORT=/i
              # Check if REPORT is as expected
              result = line.scan(/=.*$/)[0].tr("=", "")
              result = result.split(",")
              expect(@controller.view).to receive(:displayOutput).with(result[0].to_i, result[1].to_i, result[2])
            end
          end
        end
        file.close
      rescue => error
        raise IOError, "Failed to read input file:  #{error}"
      end
      @controller.readCommands(File.join(File.dirname(__FILE__), "/data/test_data.txt"))
    end
  end

end