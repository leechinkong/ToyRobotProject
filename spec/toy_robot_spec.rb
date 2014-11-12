require 'spec_helper'
 
 # Tests for ToyRobot
describe ToyRobot do

  # Test play
  describe "#play" do
    it "when file is nil" do
      file = nil
      expect_any_instance_of(RobotController).not_to receive(:processCommand)
      ToyRobot.play(file)
    end
    it "when file is empty" do
      file = ""
      expect_any_instance_of(RobotController).not_to receive(:processCommand)
      ToyRobot.play(file)
    end
    it "when file is unknown" do
      file = "unknown"
      expect_any_instance_of(RobotController).not_to receive(:processCommand)
      ToyRobot.play(file)
    end
    it "when file is valid" do
      file = File.join(File.dirname(__FILE__), "/data/test_data.txt")
      expect_any_instance_of(RobotController).to receive(:processCommand).at_least(:once)
      ToyRobot.play(file)
    end
  end

end
