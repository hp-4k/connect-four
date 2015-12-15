require 'spec_helper'

RSpec.describe Cell do
  
  subject { Cell.new }
  
  it "is initialized with no arguments" do
    expect { Cell.new }.to_not raise_error
    expect { Cell.new(0) }.to raise_error ArgumentError
  end
  
  it  {is_expected.to respond_to :color }
  
  it "is initialized with blank color" do
    expect(Cell.new.color).to be :blank
  end
  
  it "can change color" do
    cell = Cell.new
    cell.color = :blue
    expect(cell.color).to be :blue
  end
  
  describe "#to_s" do
    context "when blank" do
      it "is printed as ' '" do
        expect(Cell.new.to_s).to eq ' '
      end
    end
    
    context "when blue" do
      it "is printed as 'B'" do
        cell = Cell.new
        cell.color = :blue
        expect(cell.to_s).to eq 'B'
      end
    end
    
    context "when yellow" do
      it "is printed as 'Y'" do
        cell = Cell.new
        cell.color = :yellow
        expect(cell.to_s).to eq 'Y'
      end
    end
  end
  
end