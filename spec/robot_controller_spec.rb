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
      expect(@controller.processCommand("PLACE NORTH")).to eq(false)  
      expect(@controller.processCommand("PLACE 0,0,UNKNOWN")).to eq(false)         
    end
    it "when command is a valid first command" do
      expect(@controller.processCommand("PLACE 0,0,NORTH")).to eq(true)
    end
    it "when command is an invalid subsequent command" do
      # Place the robot on the table first
      @controller.processCommand("PLACE 0,0,NORTH")
      # Test if subsequent invalid commands failed
      expect(@controller.processCommand(nil)).to eq(false)
      expect(@controller.processCommand("UNKNOWN")).to eq(false)
    end
    it "when command is a valid subsequent command" do
      # Place the robot on the table first
      @controller.processCommand("PLACE 0,0,NORTH")
      # Test if subsequent valid commands are successful
      expect(@controller.processCommand("PLACE 0,0,NORTH")).to eq(true)
      expect(@controller.processCommand("MOVE")).to eq(true)
      expect(@controller.processCommand("LEFT")).to eq(true)
      expect(@controller.processCommand("RIGHT")).to eq(true)
    end
    it "when command is mixed or lowercases" do
      # Place the robot on the table first
      @controller.processCommand("PLACE 0,0,NORTH")
      # Test if subsequent valid commands are successful
      expect(@controller.processCommand("place 0,0,North")).to eq(true)
      expect(@controller.processCommand("mOvE")).to eq(true)
      expect(@controller.processCommand("left")).to eq(true)
      expect(@controller.processCommand("RIGHT")).to eq(true)
    end
    it "when PLACE command has invalid x and y" do
      # Test when x and y is greater than the table dimension
      expect(@controller.processCommand("PLACE 5,5,NORTH")).to eq(false) 
      # Test when x and y is nagative value     
      expect(@controller.processCommand("PLACE -1,-1,NORTH")).to eq(false)     
    end
  end
  
end