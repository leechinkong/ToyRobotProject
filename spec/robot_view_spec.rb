require 'spec_helper'

# Tests for RobotView
describe RobotView do

  # Create a new instance for each test
  before :each do
    @view = RobotView.new
  end

  # Test initialize
  describe "#new" do
    it "is an instance of RobotView" do
      expect(@view).to be_an_instance_of(RobotView)
    end
  end

  # Test displayOutput
  describe "#displayOutput" do
    it "when x, y and face is supplied" do
      expect{@view.displayOutput(0, 0, "unknown")}.to output("0,0,unknown").to_stdout
      expect{@view.displayOutput(2, 3, Direction::N)}.to output("2,3,NORTH").to_stdout
    end
  end

end