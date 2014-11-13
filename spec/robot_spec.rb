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

  # Test update
  describe "#update" do
    it "when x, y and face is not valid" do
      robot = Robot.new(0,0,Direction::N)
      expect{robot.update("",0,Direction::N)}.to raise_error(ArgumentError)
      expect{robot.update(0,"",Direction::N)}.to raise_error(ArgumentError)
      expect{robot.update("","",Direction::N)}.to raise_error(ArgumentError)
      expect{robot.update(0,0,nil)}.to raise_error(ArgumentError)
    end
    it "when x, y and face is valid" do
      robot = Robot.new(0,0,Direction::N)
      expect{robot.update(1,1,Direction::E)}.not_to raise_error
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(1)
      expect(robot.face).to eq(Direction::E)
    end
  end

  # Test updatePosition
  describe "#updatePosition" do
    it "when x and y is not numeric" do
      robot = Robot.new(0,0,Direction::N)
      expect{robot.updatePosition("",0)}.to raise_error(ArgumentError)
      expect{robot.updatePosition(0,"")}.to raise_error(ArgumentError)
      expect{robot.updatePosition("","")}.to raise_error(ArgumentError)
    end
    it "when x and y is valid" do
      robot = Robot.new(0,0,Direction::N)
      expect{robot.updatePosition(1,1)}.not_to raise_error
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(1)
    end
  end

  # Test updateFace
  describe "#updateFace" do
    it "when face is not provided" do
      robot = Robot.new(0,0,Direction::N)
      expect{robot.updateFace(nil)}.to raise_error(ArgumentError)
    end
    it "when face is valid" do
      robot = Robot.new(0,0,Direction::N)
      expect{robot.updateFace(Direction::E)}.not_to raise_error
      expect(robot.face).to eq(Direction::E)
    end
  end

end