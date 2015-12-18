require 'spec_helper'

RSpec.describe Board do
  
  let(:board) { Board.new }
  
  describe '#new' do
    it 'does not take any argumnets' do
      expect(board).to be_an_instance_of Board
      expect { Board.new(0) }.to raise_error ArgumentError
    end
    
    it 'is created with no tokens' do
      expect(board.tokens.all? { |token| token.nil? }).to be true
    end
  end
  
  describe '#tokens' do
    it 'returns all 42 tokens' do
      expect(board.tokens.length).to eq 42
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
        expect(board.to_s).to eq empty_board
      end
    end
  end
  
  describe '#insert_token' do
    it "takes two arguments" do
      expect { board.insert_token(2, "a token")  }.not_to raise_error
      expect {  board.insert_token }.to raise_error ArgumentError
    end
    
    it "throws ArgumentError when given invalid column number" do
      expect { board.insert_token(0, "a token") }.to raise_error ArgumentError
      expect { board.insert_token(8, "a token") }.to raise_error ArgumentError
      expect { board.insert_token(3, "a token") }.not_to raise_error
    end
    
    it "places the given token at the lowest free space in the given column" do
      board.insert_token(1, "T")
      expected_board = <<END_STRING
|1|2|3|4|5|6|7|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
|T| | | | | | |
END_STRING
      expect(board.to_s).to eq expected_board
    end
    
    it "places tokens at the lowest free space in the given column" do
      board.insert_token(4, "A")
      board.insert_token(4, "B")
      board.insert_token(5, "Z")
      board.insert_token(4, "C")
      expected_board = <<END_STRING
|1|2|3|4|5|6|7|
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | |C| | | |
| | | |B| | | |
| | | |A|Z| | |
END_STRING
      expect(board.to_s).to eq expected_board
    end
    
    it "throws FullColumnError when the column is full" do
      5.times { board.insert_token(2, "T") }
      expect { board.insert_token(2, "T") }.not_to raise_error
      expect { board.insert_token(2, "T") }.to raise_error Board::FullColumnError
    end
    
  end
  
  describe "#winner" do
    it "returns the winning token when game is over #1" do
      4.times { board.insert_token(1, 'B') }
      expect(board.winner).to eq 'B'
    end
    
    it "returns the winning token when game is over #2" do
      1.upto(4) { |n| board.insert_token(n, 'B') }
      expect(board.winner).to eq 'B'
    end
    
    it "returns the winning token when game is over #3" do
      board.insert_token(1, 'B')
      2.upto(4) { |n| board.insert_token(n, 'Y') }
      board.insert_token(2, 'B')
      3.upto(4) { |n| board.insert_token(n, 'Y') }
      board.insert_token(3, 'B')
      board.insert_token(4, 'Y')
      board.insert_token(4, 'B')
      expect(board.winner).to eq 'B'
    end
    
    it "returns nil when there is no winner" do
      [1, 3, 5, 7].each { |n| board.insert_token(n, 'B') }
      [2, 4, 6].each { |n| board.insert_token(n, 'Y') }
      [1, 3, 5, 7].each { |n| board.insert_token(n, 'Y') }
      [2, 4, 6].each { |n| board.insert_token(n, 'B') }
      expect(board.winner).to eq nil
    end
    
    it "returns nil with 3 same tokens in a row" do
      3.times { board.insert_token(1, "B") }
      expect(board.winner).to be nil
    end
    
    it "returns nil when board is empty" do
      expect(board.winner).to eq nil
    end
  end
end