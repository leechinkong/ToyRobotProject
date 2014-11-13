require 'spec_helper'

# Tests for Direction
describe Direction do

  # Test toDirection
  describe "#toDirection" do
    it "when direction string is NORTH" do
      expect(Direction.toDirection(Direction::N)).to be_an_instance_of(Direction::North)
    end
    it "when direction string is EAST" do
      expect(Direction.toDirection(Direction::E)).to be_an_instance_of(Direction::East)
    end
    it "when direction string is SOUTH" do
      expect(Direction.toDirection(Direction::S)).to be_an_instance_of(Direction::South)
    end
    it "when direction string is WEST" do
      expect(Direction.toDirection(Direction::W)).to be_an_instance_of(Direction::West)
    end
    it "when direction string is UNKNOWN" do
      expect(Direction.toDirection("UNKNOWN")).to eq(nil)
    end
  end

end