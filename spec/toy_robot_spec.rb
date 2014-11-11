require 'spec_helper'
 
 # Tests for ToyRobot
describe ToyRobot do

  # Create a new instance for each test
  before :each do
    @robot = ToyRobot.new
  end

  # Test ToyRobot initialize
  describe "#new" do
    it "is an instance of ToyRobot" do
      expect(@robot).to be_an_instance_of(ToyRobot)
    end
  end

  # Test play
  describe "#play" do
    it "when file is nil" do
      file = nil
      expect_any_instance_of(RobotController).not_to receive(:processCommand)
      @robot.play(file)
    end
    it "when file is empty" do
      file = ""
      expect_any_instance_of(RobotController).not_to receive(:processCommand)
      @robot.play(file)
    end
    it "when file is unknown" do
      file = "unknown"
      expect_any_instance_of(RobotController).not_to receive(:processCommand)
      @robot.play(file)
    end
    it "when file is valid" do
      file = File.join(File.dirname(__FILE__), "/data/test_data.txt")
      expect_any_instance_of(RobotController).to receive(:processCommand).at_least(:once)
      @robot.play(file)
    end
  end

end
