require 'spec_helper'

# Tests for Direction
describe Direction do

  # Test toDirection
  describe "#toDirection" do
    it "when direction string is NORTH" do
      expect(Direction.toDirection(Direction::N)).to be_an_instance_of(North)
    end
    it "when direction string is EAST" do
      expect(Direction.toDirection(Direction::E)).to be_an_instance_of(East)
    end
    it "when direction string is SOUTH" do
      expect(Direction.toDirection(Direction::S)).to be_an_instance_of(South)
    end
    it "when direction string is WEST" do
      expect(Direction.toDirection(Direction::W)).to be_an_instance_of(West)
    end
    it "when direction string is UNKNOWN" do
      expect(Direction.toDirection("UNKNOWN")).to eq(nil)
    end
  end

end