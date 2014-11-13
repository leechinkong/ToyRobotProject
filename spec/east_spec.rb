require 'spec_helper'

# Tests for East
describe East do

  # Create a new instance for each test
  before :each do
    @east = East.new
  end

  # Test initialize
  describe "#new" do
    it "is an instance of East" do
      expect(@east).to be_an_instance_of(East)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "when turning LEFT" do
      expect(@east.turnLeft).to be_an_instance_of(East)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when turning RIGHT" do
      expect(@east.turnRight).to be_an_instance_of(South)
    end
  end

  # Test move
  describe "#move" do
    it "when facing EAST" do
      expect(@east.move(0,0)).to eq([1,0])
    end
  end

end