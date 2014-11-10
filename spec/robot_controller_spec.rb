require 'spec_helper'

# Tests for RobotController
describe RobotController do

  # Create a new instance for each test
  before :each do
    @controller = RobotController.new
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

    it "when command is unknown" do
      expect(@controller.processCommand("UNKNOWN")).to eq(false)
    end

    it "when command is not the expected first command" do
      expect(@controller.processCommand("MOVE")).to eq(false)
      expect(@controller.processCommand("LEFT")).to eq(false)
      expect(@controller.processCommand("RIGHT")).to eq(false)
    end

    it "when command is an invalid first command" do
      expect(@controller.processCommand("PLACE")).to eq(false)
      expect(@controller.processCommand("PLACE 0,0")).to eq(false)
      expect(@controller.processCommand("PLACE #{Direction::N}")).to eq(false)  
      expect(@controller.processCommand("PLACE 0,0,UNKNOWN")).to eq(false)         
    end

    it "when command is a valid first command" do
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
    end

    it "when command is an invalid subsequent command" do
      # Place the robot on the table first
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      # Test if subsequent invalid commands failed
      expect(@controller.processCommand(nil)).to eq(false)
      expect(@controller.processCommand("UNKNOWN")).to eq(false)
    end

    it "when command is a valid subsequent command" do
      # Place the robot on the table first
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      # Test if subsequent valid commands are successful
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      expect(@controller.processCommand("MOVE")).to eq(true)
      expect(@controller.processCommand("LEFT")).to eq(true)
      expect(@controller.processCommand("RIGHT")).to eq(true)
    end

    it "when command is mixed or lowercases" do
      # Place the robot on the table first
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      # Test if subsequent valid commands are successful
      expect(@controller.processCommand("place 0,0,#{Direction::N}")).to eq(true)
      expect(@controller.processCommand("mOvE")).to eq(true)
      expect(@controller.processCommand("left")).to eq(true)
      expect(@controller.processCommand("RIGHT")).to eq(true)
    end

    it "when PLACE command has invalid x and y" do
      # Test when x and y is greater than the table dimension
      expect(@controller.processCommand("PLACE 5,5,#{Direction::N}")).to eq(false) 
      # Test when x and y is nagative value     
      expect(@controller.processCommand("PLACE -1,-1,#{Direction::N}")).to eq(false)     
    end

    it "when PLACE command has valid x and y" do
      expect(@controller.processCommand("PLACE 0,4,#{Direction::N}")).to eq(true)     
      expect(@controller.processCommand("PLACE 4,0,#{Direction::N}")).to eq(true)  
      expect(@controller.processCommand("PLACE 2,2,#{Direction::N}")).to eq(true)     
      expect(@controller.processCommand("PLACE 4,4,#{Direction::N}")).to eq(true)     
    end

    it "when robot is at NORTH-EAST edge and MOVE command is invalid" do
      # Place the robot at the NORTH-EAST edge of the table first
      expect(@controller.processCommand("PLACE 4,4,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the NORTH edge
      expect(@controller.processCommand("MOVE")).to eq(false)
      # Turn the robot to face EAST
      expect(@controller.processCommand("RIGHT")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the EAST edge
      expect(@controller.processCommand("MOVE")).to eq(false)
    end

    it "when robot is at NORTH-WEST edge and MOVE command is invalid" do
      # Place the robot at the NORTH-WEST edge of the table first
      expect(@controller.processCommand("PLACE 0,4,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the NORTH edge
      expect(@controller.processCommand("MOVE")).to eq(false)
      # Turn the robot to face WEST
      expect(@controller.processCommand("LEFT")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the WEST edge
      expect(@controller.processCommand("MOVE")).to eq(false)
    end

    it "when robot is at SOUTH-WEST edge and MOVE command is invalid" do
      # Place the robot at the SOUTH-WEST edge of the table
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST
      expect(@controller.processCommand("LEFT")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the WEST edge
      expect(@controller.processCommand("MOVE")).to eq(false)
      # Turn the robot to face SOUTH
      expect(@controller.processCommand("LEFT")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the SOUTH edge
      expect(@controller.processCommand("MOVE")).to eq(false)
    end

    it "when robot is at SOUTH-EAST edge and MOVE command is invalid" do
      # Place the robot at the SOUTH-EAST edge of the table
      expect(@controller.processCommand("PLACE 4,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST
      expect(@controller.processCommand("RIGHT")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the EAST edge
      expect(@controller.processCommand("MOVE")).to eq(false)
      # Turn the robot to face SOUTH
      expect(@controller.processCommand("RIGHT")).to eq(true)
      # Test when subsequent MOVE command will cause the robot to fall off the SOUTH edge
      expect(@controller.processCommand("MOVE")).to eq(false)
    end

    it "when robot is at NORTH-EAST edge and MOVE command is valid" do
      # Place the robot at the NORTH-EAST edge of the table first
      expect(@controller.processCommand("PLACE 4,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST
      expect(@controller.processCommand("LEFT")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards WEST
      expect(@controller.processCommand("MOVE")).to eq(true)
      # Place the robot back at the NORTH-EAST edge of the table
      expect(@controller.processCommand("PLACE 4,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST then SOUTH
      expect(@controller.processCommand("LEFT")).to eq(true)
      expect(@controller.processCommand("LEFT")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards SOUTH
      expect(@controller.processCommand("MOVE")).to eq(true)
    end

    it "when robot is at NORTH-WEST edge and MOVE command is valid" do
      # Place the robot at the NORTH-WEST edge of the table first
      expect(@controller.processCommand("PLACE 0,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST
      expect(@controller.processCommand("RIGHT")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards EAST
      expect(@controller.processCommand("MOVE")).to eq(true)
      # Place the robot back at the NORTH-WEST edge of the table
      expect(@controller.processCommand("PLACE 0,4,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST then SOUTH
      expect(@controller.processCommand("RIGHT")).to eq(true)
      expect(@controller.processCommand("RIGHT")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards SOUTH
      expect(@controller.processCommand("MOVE")).to eq(true)
    end

    it "when robot is at SOUTH-WEST edge and MOVE command is valid" do
      # Place the robot at the SOUTH-WEST edge of the table
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards NORTH
      expect(@controller.processCommand("MOVE")).to eq(true)
      # Place the robot back at the SOUTH-WEST edge of the table
      expect(@controller.processCommand("PLACE 0,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face EAST
      expect(@controller.processCommand("RIGHT")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards EAST
      expect(@controller.processCommand("MOVE")).to eq(true)
    end

    it "when robot is at SOUTH-EAST edge and MOVE command is valid" do
      # Place the robot at the SOUTH-EAST edge of the table
      expect(@controller.processCommand("PLACE 4,0,#{Direction::N}")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards NORTH
      expect(@controller.processCommand("MOVE")).to eq(true)
      # Place the robot back at the SOUTH-EAST edge of the table
      expect(@controller.processCommand("PLACE 4,0,#{Direction::N}")).to eq(true)
      # Turn the robot to face WEST
      expect(@controller.processCommand("LEFT")).to eq(true)
      # Test when subsequent MOVE command moves the robot 1 unit towards WEST
      expect(@controller.processCommand("MOVE")).to eq(true)
    end
  end

end