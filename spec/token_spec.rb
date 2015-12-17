require 'spec_helper'

RSpec.describe Token do
  
  subject { Token.new(:blue) }
  
  it "is initialized with a color" do
    expect { Token.new(:blue) }.to_not raise_error
    expect { Token.new }.to raise_error ArgumentError
  end
  
  it  {is_expected.to respond_to :color }
  
  it "can change color" do
    token = Token.new(:yellow)
    token.color = :blue
    expect(token.color).to be :blue
  end
  
  describe "#to_s" do
    
    context "when blue" do
      it "is printed as 'B'" do
        token = Token.new(:blue)
        expect(token.to_s).to eq 'B'
      end
    end
    
    context "when yellow" do
      it "is printed as 'Y'" do
        token = Token.new(:yellow)
        expect(token.to_s).to eq 'Y'
      end
    end
  end
  
  describe "#==" do
    context "when two tokens have the same colour" do
      it "returns true" do
        token1 = Token.new(:blue)
        token2 = Token.new(:blue)
        expect(token1 == token2).to be true
      end
    end
    
    context "when two tokens have different colour" do
      it "returns false" do
        token1 = Token.new(:blue)
        token2 = Token.new(:yellow)
        expect(token1 == token2).to be false
      end
    end
  
  end
  
end