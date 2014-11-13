require 'spec_helper'

# Tests for Robot
describe Robot do

  # Create a new table instance for each test
  before :each do
    @table = Table.new(5, 5)
  end

  # Test initialize
  describe "#new" do
    it "is an instance of Robot" do
      robot = Robot.new(0,0,Direction::N,@table)
      expect(robot).to be_an_instance_of(Robot)
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      expect(robot.face).to be_an_instance_of(Direction::North)

      robot = Robot.new(2,3,Direction::E,@table)
      expect(robot).to be_an_instance_of(Robot)
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(3)
      expect(robot.face).to be_an_instance_of(Direction::East)
    end
    it "when x and y is not numeric" do
      expect{Robot.new("",0,Direction::N,@table)}.to raise_error(ArgumentError)
      expect{Robot.new(0,"",Direction::N,@table)}.to raise_error(ArgumentError)
      expect{Robot.new("","",Direction::N,@table)}.to raise_error(ArgumentError)
    end
  end

  # Test update
  describe "#update" do
    it "when x, y and face is not valid" do
      robot = Robot.new(0,0,Direction::N,@table)
      expect{robot.update("",0,Direction::N)}.to raise_error(ArgumentError)
      expect{robot.update(0,"",Direction::N)}.to raise_error(ArgumentError)
      expect{robot.update("","",Direction::N)}.to raise_error(ArgumentError)
      expect{robot.update(0,0,nil)}.to raise_error(ArgumentError)
    end
    it "when x, y and face is valid" do
      robot = Robot.new(0,0,Direction::N,@table)
      expect{robot.update(1,1,Direction::E)}.not_to raise_error
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(1)
      expect(robot.face).to be_an_instance_of(Direction::East)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "when face is NORTH" do
      robot = Robot.new(0,0,Direction::N,@table)
      expect(robot.turnLeft).to be_an_instance_of(Direction::West)
    end
    it "when face is EAST" do
      robot = Robot.new(0,0,Direction::E,@table)
      expect(robot.turnLeft).to be_an_instance_of(Direction::North)
    end
    it "when face is SOUTH" do
      robot = Robot.new(0,0,Direction::S,@table)
      expect(robot.turnLeft).to be_an_instance_of(Direction::East)
    end
    it "when face is WEST" do
      robot = Robot.new(0,0,Direction::W,@table)
      expect(robot.turnLeft).to be_an_instance_of(Direction::South)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when face is NORTH" do
      robot = Robot.new(0,0,Direction::N,@table)
      expect(robot.turnRight).to be_an_instance_of(Direction::East)
    end
    it "when face is EAST" do
      robot = Robot.new(0,0,Direction::E,@table)
      expect(robot.turnRight).to be_an_instance_of(Direction::South)
    end
    it "when face is SOUTH" do
      robot = Robot.new(0,0,Direction::S,@table)
      expect(robot.turnRight).to be_an_instance_of(Direction::West)
    end
    it "when face is WEST" do
      robot = Robot.new(0,0,Direction::W,@table)
      expect(robot.turnRight).to be_an_instance_of(Direction::North)
    end
  end

  # Test move
  describe "#move" do
    it "when face is NORTH" do
      robot = Robot.new(0,0,Direction::N,@table)
      robot.move
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(1)
    end
    it "when face is EAST" do
      robot = Robot.new(0,0,Direction::E,@table)
      robot.move
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(0)
    end
    it "when face is SOUTH" do
      robot = Robot.new(4,4,Direction::S,@table)
      robot.move
      expect(robot.x).to eq(4)
      expect(robot.y).to eq(3)
    end
    it "when face is WEST" do
      robot = Robot.new(4,4,Direction::W,@table)
      robot.move
      expect(robot.x).to eq(3)
      expect(robot.y).to eq(4)
    end
  end

end