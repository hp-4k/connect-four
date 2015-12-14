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
  
end