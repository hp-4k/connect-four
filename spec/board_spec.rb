require 'spec_helper'

RSpec.describe Board do
  
  describe '#new' do
    it 'does not take any argumnets' do
      expect(Board.new).to be_an_instance_of Board
      expect { Board.new(0) }.to raise_error ArgumentError
    end
    
    it 'is created with all tokens empty' do
      expect(Board.new.tokens.all? { |token| token.nil? }).to be true
    end
  end
  
  describe '#tokens' do
    it 'returns all 42 tokens' do
      expect(Board.new.tokens.length).to eq 42
    end
  end
  
  describe '#print' do
    context 'with empty board' do
      it 'correctly prints an empty board' do
        empty_board = <<END_STRING
|1|2|3|4|5|6|7|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
END_STRING
        expect(Board.new.to_s).to eq empty_board
      end
    end
  end
  
end