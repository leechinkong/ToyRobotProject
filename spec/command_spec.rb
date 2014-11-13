require 'spec_helper'

# Tests for Command
describe Command do

  # Test validate
  describe "#validate" do
    it "when command is nil" do
      expect(Command.validate(nil)).to eq(nil)
    end
    it "when command is unknown" do
      expect(Command.validate("UNKNOWN")).to eq(nil)
    end
    it "when command is an invalid place command" do
      expect(Command.validate("#{Command::P}")).to eq(nil)
      expect(Command.validate("#{Command::P} 0,0")).to eq(nil)
      expect(Command.validate("#{Command::P} #{Direction::N}")).to eq(nil)  
      expect(Command.validate("#{Command::P} 0,0,UNKNOWN")).to eq(nil)         
    end
    it "when command is a valid place command" do
      expect(Command.validate("#{Command::P} 0,0,#{Direction::N}")).to eq(Command::P)
    end
    it "when command is other valid command" do
      expect(Command.validate("#{Command::M}")).to eq(Command::M)
      expect(Command.validate("#{Command::L}")).to eq(Command::L)
      expect(Command.validate("#{Command::R}")).to eq(Command::R)
      expect(Command.validate("#{Command::RP}")).to eq(Command::RP)
    end
  end

end