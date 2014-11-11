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
  # Expect displayOutput to display input parameters as in.
  describe "#displayOutput" do
    it "when x, y or face is nil" do
      expect{@view.displayOutput(nil, nil, nil)}.to raise_error(ArgumentError)
      expect{@view.displayOutput(nil, 0, Direction::N)}.to raise_error(ArgumentError)
      expect{@view.displayOutput(0, nil, Direction::N)}.to raise_error(ArgumentError)
      expect{@view.displayOutput(0, 0, nil)}.to raise_error(ArgumentError)
    end
    it "when x, y and face are supplied" do
      expect{@view.displayOutput(0, 0, "unknown")}.to output(/^0,0,unknown$/).to_stdout
      expect{@view.displayOutput(2, 3, Direction::N)}.to output(/^2,3,NORTH$/).to_stdout
    end
  end

  # Test captureInput
  # Expect captureInput to return input as in.
  describe "#captureInput" do
    it "when input is empty" do
      @view.stub(:gets){""}
      expect(@view.captureInput()).to eq("")
    end
    it "when input is a string" do
      @view.stub(:gets){"testing"}
      expect(@view.captureInput()).to eq("testing")
    end
  end

end