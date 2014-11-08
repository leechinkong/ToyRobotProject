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

end
