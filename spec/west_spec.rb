require 'spec_helper'

# Tests for West
describe West do

  # Create a new instance for each test
  before :each do
    @west = West.new
  end

  # Test initialize
  describe "#new" do
    it "is an instance of West" do
      expect(@west).to be_an_instance_of(West)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "when turning LEFT" do
      expect(@west.turnLeft).to be_an_instance_of(North)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when turning RIGHT" do
      expect(@west.turnRight).to be_an_instance_of(South)
    end
  end

  # Test move
  describe "#move" do
    it "when facing WEST" do
      expect(@west.move(0,0)).to eq([-1,0])
    end
  end

end