require 'spec_helper'

# Tests for Direction
describe Direction do

  UNKNOWN = "UNKNOWN"

  # Test turnLeft
  describe "#turnLeft" do
    it "when facing NORTH" do
      expect(Direction.turnLeft(Direction::N)).to eq(Direction::W)
    end
    it "when facing EAST" do
      expect(Direction.turnLeft(Direction::E)).to eq(Direction::N)
    end
    it "when facing SOUTH" do
      expect(Direction.turnLeft(Direction::S)).to eq(Direction::E)
    end
    it "when facing WEST" do
      expect(Direction.turnLeft(Direction::W)).to eq(Direction::S)
    end
    it "when current direction is unknown" do
      expect(Direction.turnLeft(UNKNOWN)).to eq(UNKNOWN)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when facing NORTH" do
      expect(Direction.turnRight(Direction::N)).to eq(Direction::E)
    end
    it "when facing EAST" do
      expect(Direction.turnRight(Direction::E)).to eq(Direction::S)
    end
    it "when facing SOUTH" do
      expect(Direction.turnRight(Direction::S)).to eq(Direction::W)
    end
    it "when facing WEST" do
      expect(Direction.turnRight(Direction::W)).to eq(Direction::N)
    end
    it "when current direction is unknown" do
      expect(Direction.turnRight(UNKNOWN)).to eq(UNKNOWN)
    end
  end

  # Test move
  describe "#move" do
    it "when facing NORTH" do
      expect(Direction.move(0,0,Direction::N)).to eq([0,1])
    end
    it "when facing EAST" do
      expect(Direction.move(0,0,Direction::E)).to eq([1,0])
    end
    it "when facing SOUTH" do
      expect(Direction.move(0,0,Direction::S)).to eq([0,-1])
    end
    it "when facing WEST" do
      expect(Direction.move(0,0,Direction::W)).to eq([-1,0])
    end
    it "when current direction is unknown" do
      expect(Direction.move(0,0,UNKNOWN)).to eq([0,0])
    end
  end

end