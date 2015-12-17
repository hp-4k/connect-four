require 'spec_helper'

RSpec.describe Game do
  
  it "takes a board as a single argument" do
    expect { Game.new("board") }.not_to raise_error
    expect { Game.new }.to raise_error ArgumentError
  end
  
  describe "#start" do
    puts ""  
  end
  
end