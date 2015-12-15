require 'spec_helper'

RSpec.describe Token do
  
  subject { Token.new }
  
  it "is initialized with no arguments" do
    expect { Token.new }.to_not raise_error
    expect { Token.new(0) }.to raise_error ArgumentError
  end
  
  it  {is_expected.to respond_to :color }
  
  it "is initialized with blank color" do
    expect(Token.new.color).to be :blank
  end
  
  it "can change color" do
    token = Token.new
    token.color = :blue
    expect(token.color).to be :blue
  end
  
  describe "#to_s" do
    context "when blank" do
      it "is printed as ' '" do
        expect(Token.new.to_s).to eq ' '
      end
    end
    
    context "when blue" do
      it "is printed as 'B'" do
        token = Token.new
        token.color = :blue
        expect(token.to_s).to eq 'B'
      end
    end
    
    context "when yellow" do
      it "is printed as 'Y'" do
        token = Token.new
        token.color = :yellow
        expect(token.to_s).to eq 'Y'
      end
    end
  end
  
end