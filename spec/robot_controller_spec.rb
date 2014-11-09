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
    it "when command is an not the expected first command" do
      expect(@controller.processCommand("MOVE")).to eq(false)
      expect(@controller.processCommand("LEFT")).to eq(false)
      expect(@controller.processCommand("RIGHT")).to eq(false)
    end
    it "when command is an invalid first command" do
      expect(@controller.processCommand("PLACE")).to eq(false)
      expect(@controller.processCommand("PLACE 0,0")).to eq(false)
      expect(@controller.processCommand("PLACE NORTH")).to eq(false)           
    end
    it "when command is valid first command" do
      expect(@controller.processCommand("PLACE 0,0,NORTH")).to eq(true)
    end
  end
  
end