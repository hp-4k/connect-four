require 'spec_helper'

RSpec.describe Board do
  
  describe '#new' do
    it 'does not take any argumnets' do
      expect(Board.new).to be_an_instance_of Board
      expect { Board.new(0) }.to raise_error ArgumentError
    end
    
    it 'is created with all cells blank' do
      expect(Board.new.cells.all? { |cell| cell.color == :blank }).to be true
    end
  end
  
  describe '#cells' do
    it 'returns all 42 cells' do
      expect(Board.new.cells.length).to eq 42
    end
  end

  
end