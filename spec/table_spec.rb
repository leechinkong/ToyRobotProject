require 'spec_helper'

# Tests for Table
describe Table do

  # Test initialize
  describe "#new" do
    it "is an instance of Table" do
      @table = Table.new(5,5)
      expect(@table).to be_an_instance_of(Table)
      expect(@table.width).to eq(5)
      expect(@table.height).to eq(5)

      @table = Table.new(10,8)
      expect(@table).to be_an_instance_of(Table)
      expect(@table.width).to eq(10)
      expect(@table.height).to eq(8)
    end
  end

  
   # Test validateXY
  describe "#validate" do
    it "x is invalid" do
      expect(@controller.validate(-1,0)).to eq(false)
      expect(@controller.validate(5,0)).to eq(false)
      expect(@controller.validate(10,0)).to eq(false)
    end

    it "y is invalid" do
      expect(@controller.validate(0,-1)).to eq(false)
      expect(@controller.validate(0,5)).to eq(false)
      expect(@controller.validate(0,10)).to eq(false)
    end

    it "x and y is invalid" do
      expect(@controller.validate(-1,-1)).to eq(false)
      expect(@controller.validate(5,5)).to eq(false)
      expect(@controller.validate(10,10)).to eq(false)
    end
    
    it "x and y is valid" do
      expect(@controller.validate(0,0)).to eq(true)
      expect(@controller.validate(0,4)).to eq(true)
      expect(@controller.validate(1,2)).to eq(true)
      expect(@controller.validate(3,2)).to eq(true)
      expect(@controller.validate(4,0)).to eq(true)
      expect(@controller.validate(4,4)).to eq(true)
    end
  end
end