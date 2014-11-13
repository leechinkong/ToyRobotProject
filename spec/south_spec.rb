require 'spec_helper'

# Tests for South
describe South do

  # Create a new instance for each test
  before :each do
    @south = South.new
  end

  # Test initialize
  describe "#new" do
    it "is an instance of SOUTH" do
      expect(@south).to be_an_instance_of(South)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "turn LEFT when facing SOUTH" do
      expect(@south.turnLeft).to be_an_instance_of(East)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "turn RIGHT when facing SOUTH" do
      expect(@south.turnRight).to be_an_instance_of(West)
    end
  end

  # Test move
  describe "#move" do
    it "move when facing NORTH" do
      expect(@south.move(0,0)).to eq([0,-1])
    end
  end

end