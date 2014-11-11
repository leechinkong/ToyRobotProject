require 'spec_helper'

# Tests for Command
describe Command do

  # Test validatePlace
  describe "#validatePlace" do
    it "when command is nil" do
      expect(Command.validatePlace(nil)).to eq(false)
    end
    it "when command is an invalid place command" do
      expect(Command.validatePlace("PLACE")).to eq(false)
      expect(Command.validatePlace("PLACE 0,0")).to eq(false)
      expect(Command.validatePlace("PLACE #{Direction::N}")).to eq(false)  
      expect(Command.validatePlace("PLACE 0,0,UNKNOWN")).to eq(false)         
    end
    it "when command is a valid place command" do
      expect(Command.validatePlace("PLACE 0,0,#{Direction::N}")).to eq(true)
    end
  end

  # Test validate
  describe "#validate" do
    it "when command is nil" do
      expect(Command.validate(nil)).to eq(false)
    end
    it "when command is unknown" do
      expect(Command.validate("UNKNOWN")).to eq(false)
    end
    it "when command is a valid command" do
      expect(Command.validate("MOVE")).to eq(true)
      expect(Command.validate("LEFT")).to eq(true)
      expect(Command.validate("RIGHT")).to eq(true)
      expect(Command.validate("REPORT")).to eq(true)
    end
  end

end