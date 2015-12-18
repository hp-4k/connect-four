require 'spec_helper'

RSpec.describe Game do
  
  it "takes a board as a single argument" do
    expect { Game.new("board") }.not_to raise_error
    expect { Game.new }.to raise_error ArgumentError
  end
  
  describe "#start" do
    it "prompts players for moves" do
      ARGV = []
      allow(STDIN).to receive(:gets).and_return('1')
      board = double("board")
      allow(board).to receive(:insert_token)
      allow(board).to receive(:winner).and_return("Y")
      expect { Game.new(board).start }.to output(/Choose a column to place your token in/).to_stdout
    end
  end
  
end