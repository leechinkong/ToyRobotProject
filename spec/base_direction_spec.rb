require 'spec_helper'

# Tests for BaseDirection
describe Direction::BaseDirection do

  # Create a new instance for each test
  before :each do
    @base = Direction::BaseDirection.new
  end

  # Test initialize
  describe "#new" do
    it "is an instance of BaseDirection" do
      expect(@base).to be_an_instance_of(Direction::BaseDirection)
    end
  end

  # Test turnLeft
  describe "#turnLeft" do
    it "when turning LEFT" do
      expect{@base.turnLeft}.to raise_error(NotImplementedError)
    end
  end

  # Test turnRight
  describe "#turnRight" do
    it "when turning RIGHT" do
      expect{@base.turnRight}.to raise_error(NotImplementedError)
    end
  end

  # Test move
  describe "#move" do
    it "when moving forward" do
      expect{@base.move(0,0)}.to raise_error(NotImplementedError)
    end
  end

end