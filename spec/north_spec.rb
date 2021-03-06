require 'spec_helper'

# Tests for North
describe Direction::North do

  # Create a new instance for each test
  before :each do
    @north = Direction::North.new
  end

  # Test initialize
  describe "#new" do
    it "is an instance of North" do
      expect(@north).to be_an_instance_of(Direction::North)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "when turning LEFT" do
      expect(@north.turnLeft).to be_an_instance_of(Direction::West)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when turning RIGHT" do
      expect(@north.turnRight).to be_an_instance_of(Direction::East)
    end
  end

  # Test move
  describe "#move" do
    it "when facing NORTH" do
      expect(@north.move(0,0)).to eq([0,1])
    end
  end

end