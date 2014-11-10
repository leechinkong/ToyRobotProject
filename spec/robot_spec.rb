require 'spec_helper'

# Tests for Robot
describe Robot do

  # Test initialize
  describe "#new" do
    it "is an instance of Robot" do
      robot = Robot.new(0,0,Direction::N)
      expect(robot).to be_an_instance_of(Robot)
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      expect(robot.face).to eq(Direction::N)

      robot = Robot.new(2,3,Direction::E)
      expect(robot).to be_an_instance_of(Robot)
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(3)
      expect(robot.face).to eq(Direction::E)
    end
    it "when x and y is not numeric" do
      expect{Robot.new("",0,Direction::N)}.to raise_error(ArgumentError)
      expect{Robot.new(0,"",Direction::N)}.to raise_error(ArgumentError)
      expect{Robot.new("","",Direction::N)}.to raise_error(ArgumentError)
    end
  end

end