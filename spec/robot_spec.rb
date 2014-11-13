require 'spec_helper'

# Tests for Robot
describe Robot do

  # Create a new instance for each test
  before :each do
    @robot = Robot.new(Table.new(5, 5))
  end

  # Test initialize
  describe "#new" do
    it "is an instance of Robot" do
      expect(@robot).to be_an_instance_of(Robot)
    end
  end

  # Test update
  describe "#update" do
    it "when x, y and face is not valid" do
      expect{@robot.update("",0,Direction::N)}.to raise_error(ArgumentError)
      expect{@robot.update(0,"",Direction::N)}.to raise_error(ArgumentError)
      expect{@robot.update("","",Direction::N)}.to raise_error(ArgumentError)
      expect{@robot.update(0,0,nil)}.to raise_error(ArgumentError)
    end
    it "when x, y is not within range" do
      expect{@robot.update(5,5,Direction::E)}.not_to raise_error
      expect(@robot.placed).not_to eq(true)
    end
    it "when x, y and face is valid" do
      expect{@robot.update(1,1,Direction::E)}.not_to raise_error
      expect(@robot.x).to eq(1)
      expect(@robot.y).to eq(1)
      expect(@robot.face).to eq(Direction::E)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "when robot is not on the table" do
      expect(@robot.turnLeft).nil?
    end
    it "when face is NORTH" do
      @robot.update(0,0,Direction::N)
      expect(@robot.turnLeft).to be_an_instance_of(Direction::West)
    end
    it "when face is EAST" do
      @robot.update(0,0,Direction::E)
      expect(@robot.turnLeft).to be_an_instance_of(Direction::North)
    end
    it "when face is SOUTH" do
      @robot.update(0,0,Direction::S)
      expect(@robot.turnLeft).to be_an_instance_of(Direction::East)
    end
    it "when face is WEST" do
      @robot.update(0,0,Direction::W)
      expect(@robot.turnLeft).to be_an_instance_of(Direction::South)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when robot is not on the table" do
      expect(@robot.turnRight).nil?
    end
    it "when face is NORTH" do
      @robot.update(0,0,Direction::N)
      expect(@robot.turnRight).to be_an_instance_of(Direction::East)
    end
    it "when face is EAST" do
      @robot.update(0,0,Direction::E)
      expect(@robot.turnRight).to be_an_instance_of(Direction::South)
    end
    it "when face is SOUTH" do
      @robot.update(0,0,Direction::S)
      expect(@robot.turnRight).to be_an_instance_of(Direction::West)
    end
    it "when face is WEST" do
      @robot.update(0,0,Direction::W)
      expect(@robot.turnRight).to be_an_instance_of(Direction::North)
    end
  end

  # Test move
  describe "#move" do
    it "when robot is not on the table" do
      @robot.move
      expect(@robot.x).nil?
      expect(@robot.y).nil?
    end
    it "when face is NORTH" do
      @robot.update(0,0,Direction::N)
      @robot.move
      expect(@robot.x).to eq(0)
      expect(@robot.y).to eq(1)
    end
    it "when face is EAST" do
      @robot.update(0,0,Direction::E)
      @robot.move
      expect(@robot.x).to eq(1)
      expect(@robot.y).to eq(0)
    end
    it "when face is SOUTH" do
      @robot.update(4,4,Direction::S)
      @robot.move
      expect(@robot.x).to eq(4)
      expect(@robot.y).to eq(3)
    end
    it "when face is WEST" do
      @robot.update(4,4,Direction::W)
      @robot.move
      expect(@robot.x).to eq(3)
      expect(@robot.y).to eq(4)
    end
  end

end